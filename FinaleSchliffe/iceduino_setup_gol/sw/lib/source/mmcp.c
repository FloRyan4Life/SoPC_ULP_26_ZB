#include "neorv32_iceduino.h"


void L1_receive(uint8_t *L1_PDU)
{
	uint8_t L1_SDU[L1_SDU_size] =
	{ 0 };

	// Kopieren der Schicht2 Daten in die L1_SDU/L2_PDU
	memcpy(L1_SDU, L1_PDU + 1, L1_SDU_size);

	L2_receive(L1_SDU);
}

void L2_receive(uint8_t *L2_PDU)
{

	uint8_t L2_SDU[L2_SDU_size] =
	{ 0 };
	uint8_t checksum = 0;

	// Abgleich der Checksum des Pakets (Zur Fehlererkennung des Übertragungsweges)
	for (int i = 0; i < L2_SDU_size; i++)
	{
		checksum += L2_PDU[i]; // 0x237828 bzw. 0b101011101010001010101001   1010 1111
	}

	if (((~checksum) & 0xFF) == L2_PDU[13])
	{
		memcpy(L2_SDU, L2_PDU, L2_PDU_size - 1);
		L3_receive(L2_SDU);
	}
	else
	{
		return;
	}

}

void L3_receive(uint8_t *L3_PDU)
{

	uint8_t L3_SDU[L3_SDU_size] =
	{ 0 };

	uint8_t To = L3_PDU[0];
	uint8_t From = L3_PDU[1];
	uint8_t Vers = L3_PDU[2];
	//uint8_t Hop = L3_PDU[3];

	memcpy(L3_SDU, L3_PDU + 4, L3_SDU_size);

	// Unterscheidung zwischen Weiterleiten, Lesen oder Löschen des Pakets
	if (To == myAddress && From == MMCP_MASTER_ADDRESS && Vers == MMCP_VERSION)
	{
		L7_receive(L3_SDU);
		return;
	}
	else if (To == MMCP_MASTER_ADDRESS && From != MMCP_MASTER_ADDRESS
			&& Vers == MMCP_VERSION)
	{
		// HopsCounter hochzählen
		L3_PDU[3]++;
		L2_send(L3_PDU);
		return;
		// @ToDo weiterleiten
	}
	else if (To
			!= myAddress&& From == MMCP_MASTER_ADDRESS && Vers == MMCP_VERSION)
	{
		// HopsCounter hochzählen
		L3_PDU[3]++;
		L2_send(L3_PDU);
		return;
	}
}

void L7_receive(uint8_t *L7_PDU)
{
	uint8_t L7_SDU[L7_SDU_size] =
	{ 0 };
	memcpy(L7_SDU, L7_PDU + 1, L7_SDU_size);

	uint8_t ApNr = L7_PDU[0];

	// Aktionen ausführen anhand der empfangenen ID/Aktionsanweisung
	switch (ApNr)
	{
	case 42:
		if (zustand == z_processing && !PassOnInfo)
		{
			// Send back Copy
			L7_send(ApNr, L7_SDU);
			ID42 = true;
			Cons.ID42 = true;
			memcpy(rx_buffer, L7_SDU, sizeof(L7_SDU_size));
		}
		break;
	case 43:
		if (zustand == z_processing && !PassOnInfo)
		{
			L7_send(ApNr, L7_SDU);
			ID43 = true;
			Cons.ID43 = true;
			memcpy(rx_buffer, L7_SDU, sizeof(L7_SDU_size));
		}
		break;
	case 44:
		if (zustand == z_processing && !PassOnInfo)
		{
			L7_send(ApNr, L7_SDU);
			ID44 = true;
			Cons.ID44 = true;
			memcpy(rx_buffer, L7_SDU, sizeof(L7_SDU_size));
		}
		break;
	case 50:
		// Antworten auf die Statusabfrage mittels ID50
		uint8_t z = zustand;

		if (zustand == z_failure)
		{
			uint8_t FailurePacket[L7_SDU_size] =
			{ z, FehlerID, Lager[0], Lager[1], Lager[2], Lager[3], Lager[4],
					Lager[5] };
			L7_send(50, FailurePacket);
		}
		else
		{
			uint8_t StatusPacket[L7_SDU_size] =
			{ z, packetiB, Lager[0], Lager[1], Lager[2], Lager[3], Lager[4],
					Lager[5] };
			// Send Status
			L7_send(50, StatusPacket);
		}

		Cons.ID50 = true;
		ID50 = true;
		break;
	default:
		break;
	}
}

void L7_send(uint8_t Id, uint8_t *L7_SDU)
{

	uint8_t L7_PDU[L7_PDU_size] =
	{ 0 };
	L7_PDU[0] = Id;
	memcpy(L7_PDU + 1, L7_SDU, L7_SDU_size);

	L3_send(L7_PDU);
}

void L3_send(uint8_t *L3_SDU)
{
	uint8_t L3_PDU[L3_PDU_size] =
	{ 0 };
	L3_PDU[0] = MMCP_MASTER_ADDRESS;
	L3_PDU[1] = myAddress;
	L3_PDU[2] = MMCP_VERSION;
	L3_PDU[3] = 0;

	memcpy(L3_PDU + 4, L3_SDU, L3_SDU_size);

	L2_send(L3_PDU);
}

void L2_send(uint8_t *L2_SDU)
{
	uint8_t L2_PDU[L2_PDU_size] =
	{ 0 };
	int16_t checksum = 0;

	for (int i = 0; i < L2_SDU_size; i++)
	{
		checksum += L2_SDU[i];
	}

	memcpy(L2_PDU, L2_SDU, L2_SDU_size);
	L2_PDU[13] = (uint8_t) ((~checksum) & 0xFF);

	L1_send(L2_PDU);
}

void L1_send(uint8_t *L1_SDU)
{

// Error: Used the Variable Spaces local to this function to insert into Transmit-IT-Function
// After Leaving the Function the Mem Spaces were reused -> Transmit Function sends wrong characters

	uint8_t L1_PDU[L1_PDU_size] =
	{ 0 };

	memcpy(L1_PDU + 1, L1_SDU, L1_SDU_size);
	L1_PDU[0] = 0x00;
	L1_PDU[15] = 0x00;

	memcpy(uart_tx_buffer, L1_PDU, L1_PDU_size);

	// Senden über UART1 oder UART2 (Entscheidung anhand der Uart-Flags)
	if (uart2_flag) // Schnittstelle USB
	{
		HAL_UART_Transmit_IT(&huart2, uart_tx_buffer, L1_PDU_size);
	}
	else if (uart1_flag) // Schnittstelle RS232
	{
		HAL_UART_Transmit_IT(&huart1, uart_tx_buffer, L1_PDU_size);
	}
}
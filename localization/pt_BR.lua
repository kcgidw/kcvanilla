return {
	descriptions = {
		Joker = {
			j_kcvanilla_5day = {
				name = "Previsão de Cinco Dias",
				text = {
					"Se a mão jogada contém uma",
					"{C:attention}Sequência{}, aumenta a classe",
					"das cartas jogadas em {C:attention}1{}",
					"{C:inactive}(Exceto {C:attention}Ázes{C:inactive})"
				}
			},
			j_kcvanilla_chan = {
				name = "Curinga-chan",
				text = {
					"No fim da rodada, ganha {C:mult}+#1#{} Multi", 
					"por cada Curinga {C:blue}Comum{}",
					"{C:inactive}(No momento, {C:mult}+#2#{C:inactive} Multi){}"
				}
			},
			j_kcvanilla_collapse = {
				name = "Colapso Cósmico",
				text = {
					'No fim da rodada, cartas de {C:planet}Planeta{}', 
					'contidas na mão têm {C:green}#1# em 2{} chances',
					'de tornarem-se um {C:spectral}Buraco Negro{}'
				}
			},
			j_kcvanilla_composition = {
				name = "Composição",
				text = {
					"{C:mult}+#1#{} Multi por cada Curinga à esquerda,", 
					"{C:chips}+#2#{} Fichas por cada Curinga à direita",
					"{C:inactive}(No momento, {C:mult}+#3#{C:inactive} Multi e {C:chips}+#4#{C:inactive} Fichas){}"
				}
			},
			j_kcvanilla_energy = {
				name = "Joker Energy",
				text = {
					'Cartas {C:attention}Naipe Curinga{} dão um dos', 
					'seguintes bônus quando pontuadas:',
					'{C:mult}+#1#{} Multi, {C:chips}+#2#{} Fichas, {X:mult,C:white} X#3# {} Multi ou {C:money}$#4#{}'
				}
			},
			j_kcvanilla_fortunecookie = {
				name = "Biscoito da Sorte",
				text = {
					"{C:chips}+#1#{} Fichas,", 
					"{C:chips}-#2#{} Fichas quando uma", 
					"carta de {C:tarot}Tarô{} é usada"
				}
			},
			j_kcvanilla_guard = {
				name = "Guarda Real",
			},
			j_kcvanilla_handy = {
				name = "Mãozinha Curinga",
				text = {
					'Se o primeiro descarte da rodada', 
					'for uma única carta {C:attention}Aprimorada{},',
					'ganha {X:mult,C:white}X1{} Multi, reseta quando', 
					'o Blind de Chefe é derrotado',
					'{C:inactive}(No momento, {X:mult,C:white} X#1# {C:inactive} Multi)'
				}
			},
			j_kcvanilla_irish = {
				name = "Sorte de Irlandês",
				text = {
					"{C:attention}Cartas de Sorte{} de {C:clubs}Paus{}",
					"têm {C:green}#1#X{} mais chances", 
					"de darem seus bônus"
				}
			},
			j_kcvanilla_powergrid = {
				name = "Rede Elétrica",
				text = {
					'{C:attention}Cartas Multi{} pontuadas dão ',
					'{X:mult,C:white}X#1#{} Multi por cada {C:attention}Carta Multi{}',
					'pontuada nesta rodada',
					"{C:inactive}(Próxima: {X:mult,C:white} X#2# {C:inactive} Multi)"
				}
			},
			j_kcvanilla_redenvelope = {
				name = "Envelope Vermelho",
				text = {
					'Quando Blind de Chefe é derrotado,',
					'ganhe {C:money}$8{} por cada Curinga {C:blue}Comum{}',
					'{C:inactive}(No momento, {C:money}$#1#{C:inactive})'
				}
			},
			j_kcvanilla_robo = {
				name = "Jimbot",
				text = {
					"Ganha o valor de {C:chips}Fichas{} da", 
					"primeira carta pontuada de,",
					"classe {C:attention}2-10{} cada rodada",
					"{C:inactive}(No momento, {C:chips}+#1#{C:inactive} Fichas)"
				}
			},
			j_kcvanilla_squid = {
				name = "Lula",
				text = {
					"{C:attention}+#1#{} tamanho de mão nas", 
					"2 últimas mãos da rodada", 
					"{C:inactive}(#2#)"
				}
			},
			j_kcvanilla_swiss = {
				name = "Curinga Suíço",
				text = {
					'{C:mult}+#1#{} Multi por cada carta', 
					'jogada na mão anterior', 
					'e não foi pontuada',
					'{C:inactive}(No momento, {C:mult}+#2#{C:inactive} Multi)'
				}
			},
			j_kcvanilla_tenpin = {
				name = "Dez Pinos",
				text = {
					'Se a mão jogada contém',
					'um {C:attention}10{} pontuado, {X:mult,C:white} X2 {} Multi', 
					'pelas próximas 2 mãos',
					'{C:inactive}(#1#){}'
				}
			}
		}
	},
	misc = {
		dictionary = {
			kcv_active = "Ativo",
        		kcv_inactive = "Inativo"
        	},
        	v_dictionary = {
            		kcv_active_for_X_more_hands = "Ativo pelas próximas #1# mão(s)"
        	}
	}
}

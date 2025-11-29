return {
    descriptions = {
        Joker = {
            j_kcvanilla_5day = {
                name = "Pronóstico de cinco días",
                text = {
                    "Si la mano jugada contiene",
                    "una {C:attention}escalera{}, aumenta",
                    "el rango de las cartas jugadas en {C:attention}1{}",
                    "{C:inactive}(Excluye {C:attention}ases{C:inactive})"
                }
            },
            j_kcvanilla_chan = {
                name = "Joker-chan",
                text = {
                    "Al final de la ronda, gana",
                    "{C:mult}+#1#{} multi por cada",
                    "comodín {C:blue}común{}",
                    "{C:inactive}(Actual: {C:mult}+#2#{C:inactive} multi)"
                }
            },
            j_kcvanilla_collapse = {
                name = "Colapso cósmico",
                text = {
                    "Al final de la ronda, las cartas {C:planet}planeta{}",
                    "que tengas tienen {C:green}#1# de #2#{} probabilidad",
                    "de transformarse en un {C:spectral}agujero negro{}"
                }
            },
            j_kcvanilla_composition = {
                name = "Composición",
                text = {
                    "{C:mult}+#1#{} multi por cada comodín a la izquierda,",
                    "{C:chips}+#2#{} fichas por cada comodín a la derecha",
                    "{C:inactive}(Actual: {C:mult}+#3#{C:inactive} multi y {C:chips}+#4#{C:inactive} fichas)"
                }
            },
            j_kcvanilla_energy = {
                name = "Energía de comodín",
                text = {
                    "Las cartas {C:attention}comodín{} jugadas otorgan",
                    "uno de los siguientes al puntuar:",
                    "{C:mult}+#1#{} multi, {C:chips}+#2#{} fichas, {X:mult,C:white} X#3# {} multi, {C:money}$#4#{}"
                }
            },
            j_kcvanilla_fortunecookie = {
                name = "Galleta de la fortuna",
                text = {
                    "{C:chips}+#1#{} fichas,",
                    "{C:chips}-#2#{} fichas cuando",
                    "se usa una carta de {C:tarot}tarot{}"
                }
            },
            j_kcvanilla_guard = {
                name = "Guardia real",
            },
            j_kcvanilla_handy = {
                name = "Comodín útil",
                text = {
                    "Si el {C:attention}primer descarte{} de la ronda",
                    "es una sola carta mejorada,",
                    "gana {X:mult,C:white} X1 {} multi, se reinicia",
                    "al derrotar a la {C:attention}ciega jefe{}",
                    "{C:inactive}(Actual: {X:mult,C:white} X#1# {C:inactive} multi)"
                }
            },
            j_kcvanilla_irish = {
                name = "Suerte irlandesa",
                text = {
                    "Los {C:attention}tréboles{} de {C:attention}suerte{} son",
                    "{C:green}#1#X{} más probables de tener éxito"
                }
            },
            j_kcvanilla_powergrid = {
                name = "Red de energía",
                text = {
                    "Las cartas {C:attention}multi{} jugadas",
                    "otorgan {X:mult,C:white} X#1# {} multi",
                    "por cada carta {C:attention}multi{} jugada",
                    "en esta ronda",
                    "{C:inactive}(Siguiente: {X:mult,C:white} X#2# {C:inactive} multi)"
                }
            },
            j_kcvanilla_redenvelope = {
                name = "Sobre rojo",
                text = {
                    "Cuando se derrota a la {C:attention}ciega jefe{},",
                    "gana {C:money}$8{} por cada comodín {C:blue}común{}",
                    "{C:inactive}(Actual: {C:money}$#1#{C:inactive})"
                }
            },
            j_kcvanilla_robo = {
                name = "Jimbot",
                text = {
                    "Gana el valor de {C:chips}fichas{}",
                    "de la primera carta jugada",
                    "de rango {C:attention}2-10{} cada ronda",
                    "{C:inactive}(Actual: {C:chips}+#1#{C:inactive} fichas)"
                }
            },
            j_kcvanilla_scapegoat = {
                name = "Chivo expiatorio",
                text = {
                    "Si el {C:attention}primer descarte{} de la ronda",
                    "contiene solo {C:attention}1{} carta, destrúyela",
                    "y otorga sus {C:chips}fichas{} a una",
                    "carta aleatoria en la mano"
                }
            },
            j_kcvanilla_squid = {
                name = "Calamar",
                text = {
                    "{C:attention}+#1#{} tamaño de mano en las",
                    "2 últimas manos de la ronda",
                    "{C:inactive}(#2#)"
                }
            },
            j_kcvanilla_swiss = {
                name = "Comodín suizo",
                text = {
                    "{C:mult}+#1#{} multi por cada",
                    "carta que no se jugó",
                    "en la mano anterior",
                    "{C:inactive}(Actual: {C:mult}+#2#{C:inactive} multi)"
                }
            },
            j_kcvanilla_tenpin = {
                name = "Bolo",
                text = {
                    "Si la mano jugada contiene un",
                    "{C:attention}10{} que puntúa, {X:mult,C:white} X2 {} multi",
                    "para las próximas 2 manos",
                    "{C:inactive}(#1#)"
                }
            },
            j_kcvanilla_rakugo = {
                name = "Rakugo",
                text = {
                    "Si la mano jugada contiene una {C:attention}escalera{},",
                    "reactiva cada {C:attention}4, 5, 6, 7{} o {C:attention}8{} jugado"
                }
            },
            j_kcvanilla_rats = {
                name = "¡Ratas!",
                text = {
                    "Al comenzar la ronda, {C:attention}destruye{}",
                    "una carta aleatoria en la mano",
                    "y {C:attention}duplica{} este comodín",
                    "{C:inactive}(Debe haber espacio,",
                    "{C:inactive}elimina {C:dark_edition}negativo{C:inactive} de la copia)"
                }
            }
        }
    },
    misc = {
        dictionary = {
            kcv_active = "Activo",
            kcv_inactive = "Inactivo",
            kcv_rats_msg = "¡Ratas!"
        },
        v_dictionary = {
            kcv_active_for_X_more_hands = "Activo por #1# mano(s) más"
        }
    }
}
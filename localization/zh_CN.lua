-- 翻译声明：大部分译文来自 Discord: @broookling ，有少量修订
return {
    descriptions = {
        Joker = {
            j_kcvanilla_5day = {
                name = "五日天气",
                text = {
                    "如果打出的牌中",
                    "包含{C:attention}顺子{}",
                    "打出的牌的点数提高{C:attention}1{}",
                    "{C:inactive}（{C:attention}A牌{C:inactive}除外{C:inactive}）"
                }
            },
            j_kcvanilla_chan = {
                name = "小丑酱",
                text = {
                    "回合结束时，每有一张",
                    "{C:blue}普通{}小丑牌，获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）{}"
                }
            },
            j_kcvanilla_collapse = {
                name = "宇宙坍缩",
                text = {
                    '回合结束时，持有的{C:planet}星球{}牌',
                    '有{C:green}#1#/#2#{}的几率',
                    '变成{C:spectral}黑洞{}'
                }
            },
            j_kcvanilla_composition = {
                name = "构图",
                text = {
                    "左侧的每张小丑牌{C:mult}+#1#{}倍率",
                    "右侧的每张小丑牌{C:chips}+#2#{}筹码",
                    "{C:inactive}（当前为{C:mult}+#3#{C:inactive}倍率和{C:chips}+#4#{C:inactive}筹码）{}"
                }
            },
            j_kcvanilla_energy = {
                name = "小丑能量",
                text = {
                    '打出的{C:attention}万能牌{}在计分时',
                    '随机提供以下效果之一',
                    '{C:mult}+#1#{}倍率，{C:chips}+#2#{}筹码，{X:mult,C:white} X#3# {}倍率，赚取{C:money}$#4#{}'
                }
            },
            j_kcvanilla_fortunecookie = {
                name = "幸运曲奇",
                text = {
                    "{C:chips}+#1#{}筹码",
                    "每使用一张{C:tarot}塔罗牌{}",
                    "{C:chips}-#2#{}筹码"
                }
            },
            j_kcvanilla_guard = {
                name = "皇家禁卫",
                text = {
                    "如果打出的牌中没有{C:attention}K{}或{C:attention}Q{}",
                    "你{C:attention}完整牌组{}中的", 
                    "每张{C:attention}K{}或{C:attention}Q{}提供{C:chips}+#1#{}筹码",
                    "{C:inactive}(当前为{C:chips}+#2#{C:inactive}筹码)"
                }
            },
            j_kcvanilla_handy = {
                name = "手偶小丑",
                text = {
                    '若每回合{C:attention}第一次弃牌{}',
                    '只有一张增强牌',
                    '则获得{X:mult,C:white} X1 {}倍率',
                    '击败{C:attention}Boss盲注{}后重置',
                    '{C:inactive}（当前为{X:mult,C:white} X#1# {C:inactive}倍率）'
                }
            },
            j_kcvanilla_irish = {
                name = "爱尔兰幸运",
                text = {
                    "{C:clubs}梅花{}花色的{C:attention}幸运牌",
                    "有{C:green}#1#X{}的几率成功触发"
                }
            },
            j_kcvanilla_powergrid = {
                name = "输电网",
                text = {
                    "{C:attention}倍率牌{}在计分时给予{X:mult,C:white}X#2#{}倍率",
                    "本回合每有一张计分的{C:attention}倍率牌{}",
                    "会使这一数值提高{X:mult,C:white}X0.2{}",
                    "{C:inactive}（下一张：{X:mult,C:white}X#2#{C:inactive}倍率）"
                }
            },
            j_kcvanilla_redenvelope = {
                name = "红包",
                text = {
                    '击败{C:attention}Boss盲注{}后',
                    '每有一张{C:blue}普通{}小丑牌',
                    '获得{C:money}$8{}',
                    '{C:inactive}（当前为{C:money}$#1#{C:inactive}）'
                }
            },
            j_kcvanilla_robo = {
                name = "机宝",
                text = {
                    "这张小丑牌每回合",
                    "获得第一张计分的",
                    "数字牌的{C:chips}筹码{}",
                    "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）"
                }
            },
            j_kcvanilla_scapegoat = {
                name = "替罪羊",
                text = {
                    '若每回合{C:attention}第一次弃牌{}',
                    '只有{C:attention}1{}张牌',
                    '则摧毁这张牌并将其{C:chips}筹码{}',
                    '加到手牌中的一张随机牌上'
                }
            },
            j_kcvanilla_squid = {
                name = "鱿鱼",
                text = {
                    '每回合的最后两次',
                    '出牌时，{C:attention}+#1#{}手牌上限',
                    '{C:inactive}（#2#）'
                }
            },
            j_kcvanilla_swiss = {
                name = "瑞士小丑",
                text = {
                    '上一次出牌中',
                    '每有一张未计分的牌',
                    '本次出牌{C:mult}+#1#{}倍率',
                    '{C:inactive}（当前为{C:mult}+#2#{C:inactive}倍率）'
                }
            },
            j_kcvanilla_tenpin = {
                name = "十瓶保龄",
                text = {
                    '若打出的牌中包含',
                    '一张计分的{C:attention}10{}',
                    '则接下来两次出牌{X:mult,C:white} X2 {}倍率',
                    '{C:inactive}（#1#）{}'
                }
            },
            j_kcvanilla_rakugo = {
                name = "落语艺人",
                text = {
                    '若打出的牌中包含{C:attention}顺子{}',
                    '则重新触发每张',
                    '打出的{C:attention}4{}、{C:attention}5{}、{C:attention}6{}、{C:attention}7{}和{C:attention}8{}'
                }
            },
            j_kcvanilla_rats = {
                name = "耗子！",
                text = {
                    '回合开始时，随机摧毁',
                    '手牌中的一张牌',
                    '并{C:attention}复制{}这张小丑牌',
                    '{C:inactive}（必须有空位）',
                    '{C:inactive}（移除复制牌的{C:dark_edition}负片{C:inactive}）'
                }
            },
            j_kcvanilla_loosetooth = {
                name = "松动牙齿",
                text = {
                    '若打出的牌中包含',
                    '一张{C:attention}不计分的A{}',
                    '则生成一张{C:tarot}塔罗牌{}',
                    '{C:inactive}（必须有空位）{}'
                }
            }
        }
    },
    misc = {
        dictionary = {
            kcv_active = "激活",
            kcv_inactive = "未激活",
            kcv_rats_msg = "耗子！",
            kcv_discover_all = "发现所有小丑",
            kcv_undiscover_all = "隐藏所有小丑"
        },
        v_dictionary = {
            kcv_active_for_X_more_hands = "再持续#1#次出牌"
        }
    }
}

let jokers = [
	{
		name: 'Composition',
		text: ['+4 Mult for each Joker to the left, +30 Chips for each Joker to the right'],
		image_url: 'assets/originals/mondrian.png',
		rarity: 'Common',
	},
	{
		name: 'Fortune Cookie',
		text: ['+150 Chips, -50 Chips when Tarot card is used'],
		image_url: 'assets/originals/fortunecookie.png',
		rarity: 'Common',
	},
	{
		name: 'Robo-Joker',
		text: ['Gains the Chip value of the first scored card ranked 2-10 each round'],
		image_url: 'assets/originals/robo.png',
		rarity: 'Common',
	},
	{
		name: 'Squid',
		text: ['+5 hand size on final 2 hands of round'],
		image_url: 'assets/originals/squid.png',
		rarity: 'Common',
	},
	{
		name: 'Ten-Pin',
		text: [`If played hand contains a scoring 10, X2 Mult for next 2 hands`],
		image_url: 'assets/originals/tenpin.png',
		rarity: 'Common',
	},
	{
		name: 'Red Envelope',
		text: ['When Boss Blind is defeated, earn $8 for each Common Joker'],
		image_url: 'assets/originals/redenvelope.png',
		rarity: 'Common',
	},
	{
		name: 'Swiss Joker',
		text: ['+10 Mult for each card played in previous hand that did not score'],
		image_url: 'assets/originals/cheese.png',
		rarity: 'Uncommon',
	},
	{
		name: 'Joker-chan',
		text: ['At end of round, gains +2 Mult for each Common Joker'],
		image_url: 'assets/originals/chan.png',
		rarity: 'Uncommon',
	},
	{
		name: 'Five-Day Forecast',
		text: [
			`If played hand contains a Straight, increase played cards' ranks by 1 (Excludes Aces)`,
		],
		image_url: 'assets/originals/5day.png',
		rarity: 'Uncommon',
	},
	{
		name: 'Handy Joker',
		text: [
			'If first discard of round is a single enhanced card, gain X1 Mult, resets when Boss Blind is defeated',
		],
		image_url: 'assets/originals/sock.png',
		rarity: 'Uncommon',
	},
	{
		name: 'Joker Energy',
		text: [
			'Played Wild cards give one of the following when scored: +10 Mult, +100 Chips, X2 Mult, $5',
		],
		image_url: 'assets/originals/energy.png',
		rarity: 'Uncommon',
	},
	{
		name: 'Power Grid',
		text: ['Scoring Mult cards gives X0.2 Mult for each Mult card scored this round'],
		image_url: 'assets/originals/powergrid.png',
		rarity: 'Uncommon',
	},
	{
		name: 'Royal Guard',
		text: ['After 13 Kings or Queens score, sell this to make a random Joker Negative'],
		image_url: 'assets/originals/guard.png',
		rarity: 'Rare',
	},
	{
		name: 'Cosmic Collapse',
		text: [
			'At end of round, held Planet cards each have 1 in 3 chance to transform into a Black Hole',
		],
		image_url: 'assets/originals/collapse.png',
		rarity: 'Rare',
	},
	{
		name: 'Luck of the Irish',
		text: ['Lucky Clubs are 4X more likely to succeed'],
		image_url: 'assets/originals/irish.png',
		rarity: 'Rare',
	},
];

// works the same.
let consumables = [
	// {
	//   name: "Joker",
	//   text: [
	//     "{C:mult}+4{} Mult"
	//   ],
	//   image_url: "assets/originals/j_joker.png",
	//   rarity: "Tarot"
	// },
	// {
	//   name: "Joker",
	//   text: [
	//     "{C:mult}+4{} Mult"
	//   ],
	//   image_url: "assets/originals/j_joker.png",
	//   rarity: "Planet"
	// },
	// {
	//   name: "Joker",
	//   text: [
	//     "{C:mult}+4{} Mult"
	//   ],
	//   image_url: "assets/originals/j_joker.png",
	//   rarity: "Spectral"
	// },
];

let card_modifications = [
	// {
	//   name: "Joker",
	//   text: [
	//     "{C:mult}+4{} Mult"
	//   ],
	//   image_url: "assets/originals/j_joker.png",
	//   rarity: "Enhancement"
	// },
	// {
	//   name: "Joker",
	//   text: [
	//     "{C:mult}+4{} Mult"
	//   ],
	//   image_url: "assets/originals/j_joker.png",
	//   rarity: "Edition"
	// },
	// {
	//   name: "Joker",
	//   text: [
	//     "{C:mult}+4{} Mult"
	//   ],
	//   image_url: "assets/originals/sticker_example.png",
	//   rarity: "Seal"
	// },
];

let decks = [
	// {
	//   name: "Joker",
	//   text: [
	//     "{C:mult}+4{} Mult"
	//   ],
	//   image_url: "assets/originals/j_joker.png",
	//   rarity: "Deck"
	// },
];

let stickers = [
	// {
	//   name: "Joker",
	//   text: [
	//     "{C:mult}+4{} Mult"
	//   ],
	//   image_url: "assets/originals/sticker_example.png",
	//   rarity: "Sticker"
	// },
];

let blinds = [
	// {
	//   name: "The Wall",
	//   text: [
	//     "Extra large blind",
	//     "{C:inactive}({C:red}4x{C:inactive} Base for {C:attention}$$$$${C:inactive})",
	//     "{C:inactive}(Appears from Ante 2)"
	//   ],
	//   image_url: "assets/originals/the_wall.png",
	//   rarity: "Boss Blind"
	// },
	// {
	//   name: "Violet Vessel",
	//   text: [
	//     "Very large blind",
	//     "{C:inactive}({C:red}6x{C:inactive} Base for {C:attention}$$$$$$$${C:inactive})",
	//     "{C:inactive}(Appears from Ante 8)"
	//   ],
	//   image_url: "assets/originals/violet_vessel.png",
	//   rarity: "Showdown"
	// },
];

let shop_items = [];

let cols = {
	MULT: '#FE5F55',
	CHIPS: '#009dff',
	MONEY: '#f3b958',
	XMULT: '#FE5F55',
	FILTER: '#ff9a00',
	ATTENTION: '#ff9a00',
	BLUE: '#009dff',
	RED: '#FE5F55',
	GREEN: '#4BC292',
	PALE_GREEN: '#56a887',
	ORANGE: '#fda200',
	IMPORTANT: '#ff9a00',
	GOLD: '#eac058',
	YELLOW: '#ffff00',
	CLEAR: '#00000000',
	WHITE: '#ffffff',
	PURPLE: '#8867a5',
	BLACK: '#374244',
	L_BLACK: '#4f6367',
	GREY: '#5f7377',
	CHANCE: '#4BC292',
	JOKER_GREY: '#bfc7d5',
	VOUCHER: '#cb724c',
	BOOSTER: '#646eb7',
	EDITION: '#ffffff',
	DARK_EDITION: '#5d5dff',
	ETERNAL: '#c75985',
	INACTIVE: '#ffffff99',
	HEARTS: '#f03464',
	DIAMONDS: '#f06b3f',
	SPADES: '#403995',
	CLUBS: '#235955',
	ENHANCED: '#8389DD',
	JOKER: '#708b91',
	TAROT: '#a782d1',
	PLANET: '#13afce',
	SPECTRAL: '#4584fa',
	VOUCHER: '#fd682b',
	EDITION: '#4ca893',
};

let rarities = {
	Common: '#009dff',
	Uncommon: '#4BC292',
	Rare: '#fe5f55',
	Legendary: '#b26cbb',
	Joker: '#708b91',
	Tarot: '#a782d1',
	Planet: '#13afce',
	Spectral: '#4584fa',
	Voucher: '#fd682b',
	Pack: '#9bb6bd',
	Enhancement: '#8389DD',
	Edition: '#4ca893',
	Seal: '#4584fa',
	Deck: '#9bb6bd',
	Sticker: '#5d5dff',
	'Boss Blind': '#5d5dff',
	Showdown: '#4584fa',
};

regex = /{([^}]+)}/g;

let add_cards_to_div = (jokers, jokers_div) => {
	for (let joker of jokers) {
		console.log('adding joker', joker.name);

		joker.text = joker.text.map((line) => {
			return line + '{}';
		});

		joker.text = joker.text.join('<br/>');
		joker.text = joker.text.replaceAll('{}', '</span>');
		joker.text = joker.text.replace(
			regex,
			function replacer(match, p1, offset, string, groups) {
				let classes = p1.split(',');

				let css_styling = '';

				for (let i = 0; i < classes.length; i++) {
					let parts = classes[i].split(':');
					if (parts[0] === 'C') {
						css_styling += `color: ${cols[parts[1].toUpperCase()]};`;
					} else if (parts[0] === 'X') {
						css_styling += `background-color: ${
							cols[parts[1].toUpperCase()]
						}; border-radius: 5px; padding: 0 5px;`;
					}
				}

				return `</span><span style='${css_styling}'>`;
			}
		);

		let joker_div = document.createElement('div');
		joker_div.classList.add('joker');
		if (joker.rarity === 'Sticker' || joker.rarity == 'Seal') {
			joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <img src="${joker.image_url}" alt="${joker.name}" class="hasback" />
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
		} else if (joker.soul) {
			joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <span class="soulholder">
          <img src="${joker.image_url}" alt="${joker.name}" class="soul-bg" />
          <img src="${joker.image_url}" alt="${joker.name}" class="soul-top" />
        </span>
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
		} else {
			joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <img src="${joker.image_url}" alt="${joker.name}" />
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
		}

		jokers_div.appendChild(joker_div);
	}
};

if (jokers.length === 0) {
	document.querySelector('.jokersfull ').style.display = 'none';
} else {
	let jokers_div = document.querySelector('.jokers');
	add_cards_to_div(jokers, jokers_div);
}

if (consumables.length === 0) {
	document.querySelector('.consumablesfull').style.display = 'none';
} else {
	let consumables_div = document.querySelector('.consumables');
	add_cards_to_div(consumables, consumables_div);
}

if (card_modifications.length === 0) {
	document.querySelector('.cardmodsfull').style.display = 'none';
} else {
	let cardmods_div = document.querySelector('.cardmods');
	add_cards_to_div(card_modifications, cardmods_div);
}

if (decks.length === 0) {
	document.querySelector('.decksfull').style.display = 'none';
} else {
	let decks_div = document.querySelector('.decks');
	add_cards_to_div(decks, decks_div);
}

if (stickers.length === 0) {
	document.querySelector('.stickersfull').style.display = 'none';
} else {
	let stickers_div = document.querySelector('.stickers');
	add_cards_to_div(stickers, stickers_div);
}

if (blinds.length === 0) {
	document.querySelector('.blindsfull').style.display = 'none';
} else {
	let blinds_div = document.querySelector('.blinds');
	add_cards_to_div(blinds, blinds_div);
}

if (shop_items.length === 0) {
	document.querySelector('.shopitemsfull').style.display = 'none';
} else {
	let shopitems_div = document.querySelector('.shopitems');
	add_cards_to_div(shop_items, shopitems_div);
}

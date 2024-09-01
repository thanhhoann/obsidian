class Snake {
	constructor(initialItems = [], initialNoItems = 0) {
		this.items = initialItems;
		this.no_items = initialNoItems;
	}

	init(items) {
		this.items = items;
		this.no_items = items.length;
	}

	get_no_items() {
		return this.no_items;
	}

	pick_start() {
		return this.items[0];
	}
	pick_last() {
		return this.items[this.no_items - 1];
	}
	pick_at_index(index) {
		return this.items[index];
	}

	add_head(stuff) {
		for (let i = 1; i <= this.no_items - 1; i++) {
			console.log(this.items[i]);
		}
		// this.items[0] = stuff;
		// return this.items;
	}
	add_tail(stuff) {
		this.items[this.size()] = stuff;
		this.size++;
		return this.items;
	}
	add_at_index(index, stuff) {}

	// removes
	remove_head() {
		this.items[0] = undefined;
		this.no_items--;
		return this.items;
	}
	remove_tail() {
		delete this.items[this.size() - 1];
		this.no_items--;
		return this.items;
	}
	remove_at_index(index) {}

	// [1,2,3,4,5] index = 1 -> [2,3,4,5]
	shrink_from_index_to_end(index) {
		for (let i = index - 1; i <= this.size() - 1; i++) {
			this.items[i] = this.items[i + 1];
		}
		this.no_items--;
		return items;
	}

	// shifts
	shift_right_at_index(index) {}
	shift_left_at_index(index) {}
}

const data = [1, 2, 3, 4, 5];
const items = new Items();
items.init(data);

console.log(items.add_start(2));

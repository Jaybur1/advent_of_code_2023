day=1

run:
		@ruby "./day${day}/main.rb"

generate-new-day:
	@mkdir -p day${day} && mkdir -p spec/day${day}
	@touch day${day}/main.rb && touch day${day}/description.txt && touch day${day}/input.txt && touch spec/day${day}/day${day}_spec.rb && touch spec/day${day}/input_test.txt

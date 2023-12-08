day=1
title='title'
run:
		@ruby "./day${day}/main.rb"

generate-new-day:
	@mkdir -p day${day} && mkdir -p spec/day${day}
	@touch day${day}/main.rb && touch day${day}/description.txt && touch day${day}/input.txt && touch spec/day${day}/day${day}_spec.rb && touch spec/day${day}/input_test.txt
	@echo "require_relative \"../helpers\"\nputs Output.title(${day},\"${title}\")\nputs Output.solution(1, \"part 1 goes here\")\nputs Output.solution(2, \"part 2 goes here\")" >> ./day${day}/main.rb
	@echo "require_relative '../../day${day}/${title}.rb'\nRSpec.describe 'Day ${day} ${title}' do\n\tit 'Part 1: Should return 4361 which is the sum of the valid part numbers' do;end\n\n\tit.skip 'Part 2: Should return' do;end\nend" >> ./spec/day${day}/day${day}_spec.rb
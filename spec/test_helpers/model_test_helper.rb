# Requires a method "minimal_data" to return a hash containing the minimally expected data.
RSpec.shared_examples 'model has expected' do |klass|
	describe '#expected_properties?' do
		it 'returns true only with at least the minimal data given' do
			if minimal_data.any?
				(0...minimal_data.length).each do |i|
					minimal_data.to_a.combination(i).each do |combination|
						expect(klass.new(combination.to_h, nil).expected_properties?).to be false
					end
				end
			end
			
			expect(klass.new(minimal_data, nil).expected_properties?).to be true
		end
	end
end

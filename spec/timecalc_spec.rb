describe Timecalc do
  examples = {
    "today" => "2019-07-20",
    "today + 3.days" => "2019-07-23",
    "today + week" => "2019-07-27",
    "today + 1.week" => "2019-07-27",
    "7.days" => "2019-07-27",
    "7.day" => "2019-07-27",
  }

  examples.each do |expr, expected_output|
    describe expr do
      let(:today) { Date.parse("2019-07-20") }
      let(:timecalc) { Timecalc.new(today) }
      let(:output) { timecalc.call(expr) }
      it do
        expect(output).to eq expected_output
      end
    end
  end
end

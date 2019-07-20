require "date"
gem "activesupport", ">=5"
require "active_support/core_ext/numeric/time"
require "active_support/core_ext/time/calculations"
require "active_support/core_ext/date/calculations"

class Timecalc
  def initialize(today=Date.today)
    @today = Date.today
  end

  attr_reader :today

  %i[
    second seconds
    minute minutes
    hour hours
    day days
    week weeks
  ].each do |unit|
    define_method(unit) { 1.send(unit) }
  end

  def call(expr)
    format_output eval(expr)
  end

  def format_output(result)
    case result
    when ActiveSupport::Duration
      # result.value % result.value % (24*3600)
      (@today + result).to_s
    else
      result.to_s
    end
  end
end

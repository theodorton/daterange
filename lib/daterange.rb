require 'active_support/core_ext/integer'
require 'active_support/core_ext/time'
require 'active_support/core_ext/date'
require 'active_support/core_ext/date_time'

class DateRange
  def self.parse(string)
    _start, _end = _parse(string)

    if _start && _end
      (_start.._end)
    else
      nil
    end
  end

  private

  UNITS = %w(minute hour day week month year)

  REGEX_PATTERNS = {
    this_unit:   /\Athis_(#{UNITS.join('|')})\Z/,
    this_n_unit: /\Athis_(\d+)_(#{UNITS.join('|')})s?\Z/,
    prev_unit:   /\Aprevious_(#{UNITS.join('|')})s?\Z/,
    prev_n_unit: /\Aprevious_(\d+)_(#{UNITS.join('|')})s?\Z/
  }

  def self._parse(string)
    case string
    when REGEX_PATTERNS[:this_unit]
      unit = REGEX_PATTERNS[:this_unit].match(string)[1]
      [
        now.public_send("beginning_of_#{unit}"),
        now.public_send("end_of_#{unit}")
      ]
    when REGEX_PATTERNS[:this_n_unit]
      matches = REGEX_PATTERNS[:this_n_unit].match(string)
      n, unit = matches[1], matches[2]
      [
        (now.public_send("beginning_of_#{unit}") - (Integer(n)-1).public_send(unit)),
        now.public_send("end_of_#{unit}")
      ]
    when REGEX_PATTERNS[:prev_n_unit]
      matches = REGEX_PATTERNS[:prev_n_unit].match(string)
      n, unit = matches[1], matches[2]
      [
        now.public_send("beginning_of_#{unit}")  - Integer(n).public_send(unit),
        now.public_send("end_of_#{unit}") - 1.public_send(unit)
      ]
    when REGEX_PATTERNS[:prev_unit]
      unit = REGEX_PATTERNS[:prev_unit].match(string)[1]
      _parse("previous_1_#{unit}")
    when 'today'
      _parse('this_day')
    when 'yesterday'
      _parse('previous_day')
    end
  end

  def self.now
    DateTime.now.utc
  end
end

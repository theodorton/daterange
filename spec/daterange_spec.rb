require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe DateRange do
  describe "type" do
    specify { expect(DateRange.parse('today')).to be_kind_of(Range) }
  end

  describe "this_minute" do
    subject { DateRange.parse('this_minute') }

    its(:min) { should eq DateTime.new(2014,  1, 12, 12,  0,  0) }
    its(:max) { should eq DateTime.new(2014,  1, 12, 12,  0, 59) }
  end

  describe "this_hour" do
    subject { DateRange.parse('this_hour') }

    its(:min) { should eq DateTime.new(2014,  1, 12, 12,  0,  0) }
    its(:max) { should eq DateTime.new(2014,  1, 12, 12, 59, 59) }
  end

  describe "this_day" do
    subject(:this_day) { DateRange.parse('this_day') }

    its(:min) { should eq DateTime.new(2014,  1, 12,  0,  0,  0) }
    its(:max) { should eq DateTime.new(2014,  1, 12, 23, 59, 59) }
  end

  describe "this_week" do
    subject(:this_week) { DateRange.parse('this_week') }

    its(:min) { should eq DateTime.new(2014,  1,  6,  0,  0,  0) }
    its(:max) { should eq DateTime.new(2014,  1, 12, 23, 59, 59) }
  end

  describe "this_month" do
    subject(:this_month) { DateRange.parse('this_month') }

    its(:min) { should eq DateTime.new(2014,  1,  1,  0,  0,  0) }
    its(:max) { should eq DateTime.new(2014,  1, 31, 23, 59, 59) }
  end

  describe "this_year" do
    subject(:this_year) { DateRange.parse('this_year') }

    its(:min) { should eq DateTime.new(2014,  1,  1,  0,  0,  0) }
    its(:max) { should eq DateTime.new(2014, 12, 31, 23, 59, 59) }
  end

  describe "this_n_minutes" do
    subject(:this_n_minutes) { DateRange.parse('this_5_minutes') }

    its(:min) { should eq DateTime.new(2014,  1, 12, 11, 56,  0) }
    its(:max) { should eq DateTime.new(2014,  1, 12, 12,  0, 59) }
  end

  describe "this_n_hours" do
    subject(:this_n_hours) { DateRange.parse('this_5_hours') }

    its(:min) { should eq DateTime.new(2014,  1, 12,  8,  0,  0) }
    its(:max) { should eq DateTime.new(2014,  1, 12, 12, 59, 59) }
  end

  describe "this_n_days" do
    subject(:this_n_days) { DateRange.parse('this_5_days') }

    its(:min) { should eq DateTime.new(2014,  1,  8,  0,  0,  0) }
    its(:max) { should eq DateTime.new(2014,  1, 12, 23, 59, 59) }
  end

  describe "this_n_weeks" do
    subject(:this_n_weeks) { DateRange.parse('this_2_weeks') }

    its(:min) { should eq DateTime.new(2013, 12, 30,  0,  0,  0) }
    its(:max) { should eq DateTime.new(2014,  1, 12, 23, 59, 59) }
  end

  describe "this_n_months" do
    subject(:this_n_months) { DateRange.parse('this_3_months') }

    its(:min) { should eq DateTime.new(2013, 11,  1,  0,  0,  0) }
    its(:max) { should eq DateTime.new(2014,  1, 31, 23, 59, 59) }
  end

  describe "this_n_years" do
    subject(:this_n_years) { DateRange.parse('this_4_years') }

    its(:min) { should eq DateTime.new(2011,  1,  1,  0,  0,  0) }
    its(:max) { should eq DateTime.new(2014, 12, 31, 23, 59, 59) }
  end

  describe "previous_n_minutes" do
    subject(:previous_n_minutes) { DateRange.parse('previous_5_minutes') }

    its(:min) { should eq DateTime.new(2014,  1, 12, 11, 55,  0) }
    its(:max) { should eq DateTime.new(2014,  1, 12, 11, 59, 59) }

    context "when the plural s-suffix is missing" do
      subject(:previous_n_minute) { DateRange.parse('previous_5_minute') }

      it { should eq previous_n_minutes }
    end
  end

  describe "previous_n_hours" do
    subject(:previous_n_hours) { DateRange.parse('previous_5_hours') }

    its(:min) { should eq DateTime.new(2014,  1, 12,  7,  0,  0) }
    its(:max) { should eq DateTime.new(2014,  1, 12, 11, 59, 59) }
  end

  describe "previous_n_days" do
    subject(:previous_n_days) { DateRange.parse('previous_5_days') }

    its(:min) { should eq DateTime.new(2014,  1,  7,  0,  0,  0) }
    its(:max) { should eq DateTime.new(2014,  1, 11, 23, 59, 59) }
  end

  describe "previous_n_weeks" do
    subject(:previous_n_weeks) { DateRange.parse('previous_2_weeks') }

    its(:min) { should eq DateTime.new(2013, 12, 23,  0,  0,  0) }
    its(:max) { should eq DateTime.new(2014,  1,  5, 23, 59, 59) }
  end

  describe "previous_n_months" do
    subject(:previous_n_months) { DateRange.parse('previous_3_months') }

    its(:min) { should eq DateTime.new(2013, 10,  1,  0,  0,  0) }
    its(:max) { should eq DateTime.new(2013, 12, 31, 23, 59, 59) }
  end

  describe "previous_n_years" do
    subject(:previous_n_years) { DateRange.parse('previous_4_years') }

    its(:min) { should eq DateTime.new(2010,  1,  1,  0,  0,  0) }
    its(:max) { should eq DateTime.new(2013, 12, 31, 23, 59, 59) }
  end

  describe "aliases" do
    describe "today" do
      subject { DateRange.parse('today') }

      it { should eq DateRange.parse('this_day') }
    end

    describe "previous_minute" do
      subject { DateRange.parse('previous_minute') }

      it { should eq DateRange.parse('previous_1_minute') }
    end

    describe "previous_hour" do
      subject { DateRange.parse('previous_hour') }

      it { should eq DateRange.parse('previous_1_hour') }
    end

    describe "previous_day" do
      subject { DateRange.parse('previous_day') }

      it { should eq DateRange.parse('previous_1_day') }
    end

    describe "yesterday" do
      subject { DateRange.parse('yesterday') }

      it { should eq DateRange.parse('previous_1_day') }
    end

    describe "previous_week" do
      subject { DateRange.parse('previous_week') }

      it { should eq DateRange.parse('previous_1_week') }
    end

    describe "previous_month" do
      subject { DateRange.parse('previous_month') }

      it { should eq DateRange.parse('previous_1_month') }
    end

    describe "previous_year" do
      subject { DateRange.parse('previous_year') }

      it { should eq DateRange.parse('previous_1_year') }
    end
  end
end

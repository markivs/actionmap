# frozen_string_literal: true

Given /the following states exist/ do |state_table|
  state_table.hashes.each do |state|
    State.create state
  end
end

Given /a state is seeded/ do
  al = State.create(name:         'Alabama',
                    symbol:       'AL',
                    fips_code:    '01',
                    is_territory: 0,
                    lat_min:      '-88.473227',
                    lat_max:      '-84.88908',
                    long_min:     '30.223334',
                    long_max:     '-84.88908')
  County.create(name:       'Test County',
                state:      al,
                fips_code:  1,
                fips_class: 'county')
end

Given /test state/ do
  california = State.create(name: 'California',
                            symbol: 'CA', fips_code: '06',
                            created_at: Time.zone.now,
                            updated_at: Time.zone.now,
                            is_territory: 0,
                            lat_min:      '-124.409591',
                            lat_max:      '-114.131211',
                            long_min:     '32.534156',
                            long_max:     '-114.131211')
  County.create(
    name:       'Almeda County',
    state:      california,
    fips_code:  '01',
    fips_class: 'county01'
  )
end

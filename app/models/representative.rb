# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []
    rep_info.officials.each_with_index do |official, index|
      o_temp = ''
      t_temp = ''
      rep_info.offices.each do |office|
        if office.official_indices.include? index
          t_temp = office.name
          o_temp = office.division_id end
      end
      rep = Representative.find_by(name: official.name)
      if rep.nil?
        rep = Representative.create!({ name: official.name, ocdid: o_temp,
          title: t_temp, photo: official.photo_url, party: official.party, address: address_formatter(official) })
      else
        rep.attributes = { ocdid: o_temp, title: t_temp, photo: official.photo_url, party: official.party,
address: address_formatter(official) }
        rep.save end
      reps.push(rep)
    end
    reps end

  def self.address_formatter(official)
    return 'Address Unknown' if official.address.nil?

    curr_address = official.address[0]
    final_address = ''
    final_address += curr_address.line1
    final_address += ', '
    final_address += curr_address.city
    final_address += ', '
    final_address += curr_address.state
    final_address += ' '
    final_address + curr_address.zip
  end
end

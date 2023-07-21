require 'test_helper'

ENV["CAPYBARA_ARTIFACTS"] = Rails.root.join("test/reports").to_s

# 'capybara' and 'capybara/cuprite' need to be defined for EvilSystems to work properly.
require 'capybara'
require 'capybara/cuprite'

require 'evil_systems'

EvilSystems.initial_setup task: "assets:precompile",
                          silent: true,
                          driver_options: {
                              window_size: [1400, 1400],
                              timeout: 250,
                          }

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :evil_cuprite

  include EvilSystems::Helpers
end

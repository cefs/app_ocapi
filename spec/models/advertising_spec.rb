require 'spec_helper'

describe Advertising do
  it { should belong_to(:user) }
end

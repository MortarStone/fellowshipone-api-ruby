module FellowshipOneExceptions
  class UnableToConnectToFellowshipOne < StandardError; end
  class UnknownErrorConnectingToFellowshipOne < StandardError; end
  class FellowshipOneResponseError < StandardError; end
end
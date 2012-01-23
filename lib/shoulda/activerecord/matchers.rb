module Shoulda
    module ActiveRecord
        module Matchers
            def failure_message
                "Did not expect #{expectation}, got error: \n#{@expected_message ? @matched_error : @errors.join("\n  ")}"
            end
        end
    end
end

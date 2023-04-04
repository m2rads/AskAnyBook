require 'singleton'
require 'resemble'
require 'dot_env'


class ResembleService
    include Singleton

    # current_environment = DotEnv.get_environment

    unless defined?(RESEMBLE_API_KEY)
        RESEMBLE_API_KEY = ENV["RESEMBLE_API_KEY"]
    end

    project_uuid = 'af410c97'
    voice_uuid = '4c6d3da5'

    def initialize
        Resemble.api_key = RESEMBLE_API_KEY
    end
# 93dd0150
# 1bc03994
    def create_clip(body)
        response = Resemble::V2::Clip.create_sync(
            '93dd0150',
            '4c6d3da5',
            body,
            title: nil,
            sample_rate: nil,
            output_format: nil,
            precision: nil,
            include_timestamps: nil,
            is_public: nil,
            is_archived: nil,
            raw: nil
        )
        return response
    end

end

module OpenStack
  module Volume
    class VolumeType

      attr_reader :id
      attr_reader :os_volume_type_access_is_public
      attr_reader :extra_specs
      attr_reader :name
      attr_reader :description

      def initialize(volume_type_info)
        @id = volume_type_info["id"]
        @os_volume_type_access_is_public = volume_type_info["os-volume-type-access:is_public"]
        @extra_specs = volume_type_info["extra_specs"]
        @name = volume_type_info["name"]
        @description = volume_type_info["description"]
      end

    end
  end
end

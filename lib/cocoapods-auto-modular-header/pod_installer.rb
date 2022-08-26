require 'cocoapods'
require_relative 'pod_target'

module Pod
  class Installer
    class Xcode
      class TargetValidator

        alias_method :origin_verify_swift_pods_have_module_dependencies, :verify_swift_pods_have_module_dependencies

        def verify_swift_pods_have_module_dependencies
          pod_targets.each do |pod_target|
            next unless pod_target.uses_swift?
            pod_target.dependent_targets.each do |dependent_target|
              next if !dependent_target.should_build? || dependent_target.defines_module?
              dependent_target.defines_module = true
            end
          end
          origin_verify_swift_pods_have_module_dependencies
        end
      end
    end
  end
end

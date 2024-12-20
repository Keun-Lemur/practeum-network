Pod::Spec.new do |spec|
  spec.name         = 'Pract'
  spec.version      = '{{.Version}}'
  spec.license      = { :type => 'GNU Lesser General Public License, Version 3.0' }
  spec.homepage     = 'https://github.com/practeum-network-network/go-practeum'
  spec.authors      = { {{range .Contributors}}
		'{{.Name}}' => '{{.Email}}',{{end}}
	}
  spec.summary      = 'iOS practeum Client'
  spec.source       = { :git => 'https://github.com/practeum-network-network/go-practeum.git', :commit => '{{.Commit}}' }

	spec.platform = :ios
  spec.ios.deployment_target  = '9.0'
	spec.ios.vendored_frameworks = 'Frameworks/Pract.framework'

	spec.prepare_command = <<-CMD
    curl https://practstore.blob.core.windows.net/builds/{{.Archive}}.tar.gz | tar -xvz
    mkdir Frameworks
    mv {{.Archive}}/Pract.framework Frameworks
    rm -rf {{.Archive}}
  CMD
end

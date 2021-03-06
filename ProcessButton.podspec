Pod::Spec.new do |spec|
  spec.name             = 'ProcessButton'
  spec.version          = '0.2.0'
  spec.license          =  'MIT' 
  spec.homepage         = 'https://github.com/Viddi/ios-process-button'
  spec.authors          = { 'Vidar Ottosson' => 'viddi@nplexity.com' }
  spec.summary          = 'Button that animates while an action is being processed'
  spec.source           = { :git => 'https://github.com/Viddi/ios-process-button.git', :tag => 'v0.2.0' }
  spec.source_files     = 'ProcessButton/ProcessButton/*'
  spec.platform         = :ios, '8.0'
  spec.requires_arc     = true
end

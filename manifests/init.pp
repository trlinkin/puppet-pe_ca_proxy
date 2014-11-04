class pe_ca_proxy (
  $proxy_target,
){

  puppet_enterprise::trapperkeeper::bootstrap_cfg { 'certificate-authority-service' :
    container => 'puppetserver',
    namespace => 'puppetlabs.enterprise.services.reverse-proxy.reverse-proxy-ca-service',
    service   => 'reverse-proxy-ca-service',
  }

  file {'/etc/puppetlabs/puppetserver/conf.d/ca_proxy.conf':
    ensure  => file,
    owner   => 'pe-puppet',
    group   => 'pe-puppet',
    mode    => '0740',
    content => template('pe_ca_proxy/proxy_conf.erb'),
  }
}
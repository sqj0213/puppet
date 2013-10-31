class haproxy($templateType='bj_ha') {
	include haproxy::install
	haproxy::config{'config':templateType=> $templateType}
	include haproxy::service
}

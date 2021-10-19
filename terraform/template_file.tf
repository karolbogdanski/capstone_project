data "template_file" "user_data" {
    template = "${file("templates/user_data.tpl")}"

    vars = {
        bootstrap_extra_args = "--enable-docker-bridge true"
        cluster_name         = local.cluster_name
    }
}
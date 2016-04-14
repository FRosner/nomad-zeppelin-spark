job "zeppelin-job" {
  datacenters = ["dc1"]
  group "zeppelin-group" {
    task "zeppelin-task" {
      driver = "docker"
      config = {
        image = "frosner/zeppelin"
        port_map = {
          http = 8080
        }
      }
      resources {
        cpu = 500
        memory = 128
        network {
          mbits = 10
          port "http" {
            static = 8080
          }
        }
      }
    }
  }
}

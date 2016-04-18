job "zeppelin-job" {
  datacenters = ["dc1"]
  group "zeppelin-group" {
    task "zeppelin-task" {
      driver = "raw_exec"
      config {
        # When running a binary that exists on the host, the path must be absolute
        command = "/usr/local/bin/zeppelin"
      }
      resources {
        cpu = 1000
        memory = 512
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

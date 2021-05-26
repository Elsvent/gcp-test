variable "controllers" {
  description = "kubernetes controller names"
  type        = list(string)
  default     = ["controller1", "controller2", "controller3"]
}
variable "workers" {
  description = "kubernetes worker names"
  type        = list(string)
  default     = ["worker1", "worker2", "worker3"]
}

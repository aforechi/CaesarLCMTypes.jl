using LCMCore
using CaesarLCMTypes

lcm=LCM()
function generate_example_msg()
  msg = example_t()
  msg.timestamp = 0
  msg.position = (1, 2, 3)
  msg.orientation = (1, 0, 0, 0)
  msg.ranges = randn(15)
  msg.num_ranges = length(msg.ranges)
  msg.name = "example string"
  msg.enabled = true
  return msg
end

msg = generate_example_msg()

data=encode(msg)

publish(lcm,"TEST_CHANNEL",data)

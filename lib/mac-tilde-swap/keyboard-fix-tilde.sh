#!/bin/bash

# Following the instrutions from https://jonnyzzz.com/blog/2017/12/04/macos-keys/
# Do this only for the built-in keyboard using the product ID. This ID used
# is for the keyboard on MacBook (Retina, 12-inch, Early 2015)
hidutil property --matching '{"ProductID":0x0272}'  --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035},{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064}]}'

echo $(date) > $HOME/Desktop/date

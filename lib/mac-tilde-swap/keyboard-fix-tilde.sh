#!/bin/bash

# Following the instrutions from https://jonnyzzz.com/blog/2017/12/04/macos-keys/
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035},{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064}]}'

echo $(date) > $HOME/Desktop/date

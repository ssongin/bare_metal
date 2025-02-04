#!/bin/bash

ansible-playbook cis.yaml --ask-become-pass --extra-vars "profile=infrastructure"

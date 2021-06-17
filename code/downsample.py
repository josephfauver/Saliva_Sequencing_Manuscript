'''
taken from https://pythonforbiologists.com/randomly-sampling-reads-from-a-fastq-file
2021-03-17
'''

from __future__ import division
import random

number_to_sample = 100

with open("test.fastq") as input:
    num_lines = sum([1 for line in input])
total_records = int(num_lines / 4)
print("sampling " + str(number_to_sample) + " out of " + str(total_records) + " records")

records_to_keep = set(random.sample(range(total_records + 1), number_to_sample))
record_number = 0
with open("test.fastq") as input:
    with open("sample.fastq", "w") as output:
        for line1 in input:
            line2 = next(input)
            line3 = next(input)
            line4 = next(input)
            if record_number in records_to_keep:
                    output.write(line1)
                    output.write(line2)
                    output.write(line3)
                    output.write(line4)
            record_number += 1
            
            
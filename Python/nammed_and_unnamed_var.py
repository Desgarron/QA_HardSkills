import sys
import argparse

# не именнованые переменные
# params = sys.argv[1:]
# print('Hello liza! I love you')
# print('params', params)
#
# for i in range(len(params)):
#     params[i] = int(params[i])
#     # print(params[i])
# sum_3 = sum(params[0:2])
#
# print('sum_3 ===', sum_3)

# именнованые переменные
parser = argparse.ArgumentParser()
parser.add_argument('--num_1', type=int)
parser.add_argument('--num_2', type=int)
parser.add_argument('--action', type=str)

args = parser.parse_args()
item_1 = args.num_1
item_2 = args.num_2
act = args.action

if act == 'sum':
    result = item_1 + item_2
    print('result ==', result)
elif act == 'multi':
    result = item_1 * item_2
    print('result ==', result)
elif act == 'div':
    result = item_1 / item_2
    print('result ==', result)
elif act == 'sub':
    result = item_1 - item_2
    print('result ==', result)

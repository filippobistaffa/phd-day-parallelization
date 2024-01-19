import argparse as ap
import pandas as pd
import numpy as np
import subprocess
import sys
import os


if __name__ == "__main__":

    llama_cpp_subdir = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'llama.cpp')

    # parse command-line arguments
    parser = ap.ArgumentParser()
    parser.add_argument('--skills_dataset', type=str, default=os.path.join(os.path.dirname(os.path.realpath(__file__)), 'skills.txt'))
    parser.add_argument('--n_skills', type=int, default=3)
    parser.add_argument('--model', type=str, default=os.path.join(llama_cpp_subdir, 'models', 'vicuna-13b-v1.5-16k.Q4_K_M.gguf'))
    parser.add_argument('--format', type=str, default='USER: {}\nASSISTANT:')
    parser.add_argument('--seed', type=int, default=0)
    args, additional = parser.parse_known_args()

    # build prompt
    np.random.seed(args.seed)
    skills_list = pd.read_csv(args.skills_dataset, sep='\t', header=None).values.ravel()
    skills_sample = np.random.choice(skills_list, size=args.n_skills)
    skills_string = ', '.join(skills_sample[:-1]).lower() + ', and ' + skills_sample[-1].lower()
    prompt = f'Give me the description of a professional course to learn how to {skills_string}'
    prompt_format = args.format.format(prompt)
    
    # llama.cpp parameters
    llama_cpp_params = {
        '--model': args.model,
        '--ctx-size': str(len(prompt_format)),
        '--seed': str(args.seed),
        '--prompt': prompt_format,
        '--repeat_penalty': '1.1',
        '--n-predict': '-1',
        '--temp': '0.7',
    }

    # build subprocess (llama.cpp) command-line
    command_line = [os.path.join(llama_cpp_subdir, 'build', 'bin' ,'main'), '--escape', '--log-disable']
    for (param, value) in llama_cpp_params.items():
        command_line.extend([param, value])
    command_line.extend(additional) # by putting additional at the end we can override the default ones

    #print(command_line)
    #quit()

    # run subprocess
    result = subprocess.run(command_line, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    # print stdout and stderr
    print(result.stdout.decode().rstrip())
    print(result.stderr.decode().rstrip(), file=sys.stderr)

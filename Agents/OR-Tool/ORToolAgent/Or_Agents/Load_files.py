# ------------------Copyright (C) 2022 University of Strathclyde and Author ---------------------------------
# --------------------------------- Author: Cheyenne Powell -------------------------------------------------
# ------------------------- e-mail: cheyenne.powell@strath.ac.uk --------------------------------------------

# To call last read data in file n-1 or n depending on the day and if file already exists
# ===========================================================================================================

def load_file(filename1, filename2):
    # ##### ground station
    results_coord = open(filename1, "r")
    results_count_coord = 0
    for line in results_coord:
        if line != "\n":
            results_count_coord += 1
    results_coord.close()

    results_coord = open(filename1, "r")
    results_count_coord = results_count_coord
    results_coord = results_coord.read()
    results_coord = results_coord.split('\n')
    results_count_coord = len(results_coord[0].split(','))

    # #####target
    results_coord1 = open(filename2, "r")
    results_count_coord1 = 0
    for line in results_coord1:
        if line != "\n":
            results_count_coord1 += 1
    results_coord1.close()

    results_coord1 = open(filename2, "r")

    results_coord1 = results_coord1.read()
    results_coord1 = results_coord1.split('\n')
    results_count_coord1 = len(results_coord1[0].split(','))

    data = []
    data1 = []

    for i in range(0, results_count_coord):
        results_data = int(results_coord[0].split(',')[i])
        data.append(results_data)

    for i in range(0, results_count_coord1):
        results_data1 = int(results_coord1[0].split(',')[i])
        data1.append(results_data1)

    gs_data, target_data = (data, data1)
    return gs_data, target_data

# def main():
#     filename1 = '../Logs/Test_1/GS.txt'
#     filename2 = '../Logs/Test_1/Target.txt'
#     load_file(filename1, filename2)
#     gs_data, target_data = load_file(filename1, filename2)
#     print(gs_data)
#     print(target_data)
# main()

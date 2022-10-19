def get_source(file):
    if 'GTEX' in file:
        return 'gtex'
    if 'TCGA' in file:
        return 'tcga'

#https://www.researchgate.net/post/How_can_I_get_the_normal_sample_of_TCGA_data
def get_status(file):
    if 'GTEX' in file:
        return 'healthy'
    if 'TCGA' in file:
        if (file[13:15]=="11") or (file[13:15]=="10"):
            return 'healthy'
        else:
            return "tumor"
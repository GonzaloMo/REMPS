

def custom_log_creator():
    import os
    import tempfile
    from ray.tune.logger import UnifiedLogger
    logdir_prefix = custom_str

    def logger_creator(config):

        if not os.path.exists(custom_path):
            os.makedirs(custom_path)
        logdir = tempfile.mkdtemp(prefix=logdir_prefix, dir=custom_path)
        return UnifiedLogger(config, logdir, loggers=None)

    return logger_creator
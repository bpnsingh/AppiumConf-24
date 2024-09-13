def get_variables(app, device1, device2):
    variables = {
                    'runner': 'cloud_beta',
                    'setup': 'bipin_env',
                    'app_id': 'DPbeta-' + app + '-BETA',
                    'lt_device1': device1,
                    'lt_device2': device2
                }
    return variables
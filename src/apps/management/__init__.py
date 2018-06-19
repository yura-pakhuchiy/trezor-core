from trezor.wire import register, protobuf_workflow
from trezor.utils import unimport
from trezor.messages.wire_types import \
    LoadDevice, ResetDevice, BackupDevice, WipeDevice, RecoveryDevice, ApplySettings, ApplyFlags, ChangePin, SetU2FCounter


@unimport
def dispatch_LoadDevice(*args, **kwargs):
    from .load_device import load_device
    return load_device(*args, **kwargs)


@unimport
def dispatch_ResetDevice(*args, **kwargs):
    from .reset_device import reset_device
    return reset_device(*args, **kwargs)


@unimport
def dispatch_BackupDevice(*args, **kwargs):
    from .backup_device import backup_device
    return backup_device(*args, **kwargs)


@unimport
def dispatch_WipeDevice(*args, **kwargs):
    from .wipe_device import wipe_device
    return wipe_device(*args, **kwargs)


@unimport
def dispatch_RecoveryDevice(*args, **kwargs):
    from .recovery_device import recovery_device
    return recovery_device(*args, **kwargs)


@unimport
def dispatch_ApplySettings(*args, **kwargs):
    from .apply_settings import apply_settings
    return apply_settings(*args, **kwargs)


@unimport
def dispatch_ApplyFlags(*args, **kwargs):
    from .apply_flags import apply_flags
    return apply_flags(*args, **kwargs)


@unimport
def dispatch_ChangePin(*args, **kwargs):
    from .change_pin import change_pin
    return change_pin(*args, **kwargs)


@unimport
def dispatch_SetU2FCounter(*args, **kwargs):
    from .set_u2f_counter import set_u2f_counter
    return set_u2f_counter(*args, **kwargs)


def boot():
    register(LoadDevice, protobuf_workflow, dispatch_LoadDevice)
    register(ResetDevice, protobuf_workflow, dispatch_ResetDevice)
    register(BackupDevice, protobuf_workflow, dispatch_BackupDevice)
    register(WipeDevice, protobuf_workflow, dispatch_WipeDevice)
    register(RecoveryDevice, protobuf_workflow, dispatch_RecoveryDevice)
    register(ApplySettings, protobuf_workflow, dispatch_ApplySettings)
    register(ApplyFlags, protobuf_workflow, dispatch_ApplyFlags)
    register(ChangePin, protobuf_workflow, dispatch_ChangePin)
    register(SetU2FCounter, protobuf_workflow, dispatch_SetU2FCounter)

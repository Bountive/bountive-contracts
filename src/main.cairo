%lang starknet

from starkware.starknet.common.syscalls import get_caller_address
from starkware.cairo.common.cairo_builtins import HashBuiltin

@storage_var
func bet_map(account : felt) -> (bet : felt) {
}

@external
func set_bet{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr,}(
    bet: felt
){
    let (sender_address) = get_caller_address();
    bet_map.write(sender_address, bet);
    return();
}

@view
func get_bet{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    account : felt
) -> (bet : felt ){
    let (bet) = bet_map.read(account);
    return (bet,);
}
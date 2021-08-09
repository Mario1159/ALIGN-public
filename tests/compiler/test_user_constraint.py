import pathlib
import pytest
import json
import shutil

from align.compiler.compiler import compiler_input, compiler_output
from align.schema.checker import Z3Checker, CheckerError

pdk_dir = pathlib.Path(__file__).resolve().parent.parent.parent / 'pdks' / 'FinFET14nm_Mock_PDK'
config_path =  pathlib.Path(__file__).resolve().parent.parent / 'files'
out_path = pathlib.Path(__file__).resolve().parent / 'Results'

@pytest.mark.parametrize('dir_name', ['high_speed_comparator_orderblock', \
    'high_speed_comparator_symmblock', 'high_speed_comparator_portlocation', 'high_speed_comparator_multiconnection', \
        'high_speed_comparator_align', 'high_speed_comparator_symmnet'])
def test_group_block_hsc(dir_name):
    circuit_name = 'high_speed_comparator'
    test_path = pathlib.Path(__file__).resolve().parent.parent / 'files' / 'test_circuits' / dir_name / (circuit_name + '.sp')
    updated_cktlib = compiler_input(test_path, circuit_name, pdk_dir, config_path)
    assert updated_cktlib.find('DP')
    assert updated_cktlib.find('CCN')
    assert updated_cktlib.find('CCP')
    assert updated_cktlib.find('INV_P')
    assert updated_cktlib.find('INV_N')
    assert updated_cktlib.find('DP_NMOS_B')
    assert updated_cktlib.find('CCP_S_NMOS_B')
    assert updated_cktlib.find('CCP_PMOS')
    assert updated_cktlib.find('INV')
    result_path = out_path / dir_name
    if result_path.exists() and result_path.is_dir():
        shutil.rmtree(result_path)
    result_path.mkdir(parents=True, exist_ok=False)
    pdk_path = pathlib.Path(__file__).parent.parent.parent / 'pdks' / 'FinFET14nm_Mock_PDK'
    compiler_output(test_path, updated_cktlib, 'high_speed_comparator', result_path, pdk_path)
    gen_const_path = result_path / 'HIGH_SPEED_COMPARATOR.verilog.json'
    gold_const_path = pathlib.Path(__file__).resolve().parent.parent / 'files' / 'test_results' / (dir_name + '.const.json')
    with open(gen_const_path, "r") as const_fp:
        gen_const = next(x for x in json.load(const_fp)['modules'] if x['name'] == 'HIGH_SPEED_COMPARATOR')["constraints"]
        gen_const.sort(key=lambda item: item.get("constraint"))
    with open(gold_const_path, "r") as const_fp:
        gold_const = json.load(const_fp)
        gold_const.sort(key=lambda item: item.get("constraint"))
    assert gold_const == gen_const


@pytest.mark.skipif(not Z3Checker.enabled, reason="Couldn't import Z3")
@pytest.mark.parametrize('dir_name', ['high_speed_comparator_broken'])
def test_constraint_checking(dir_name):
    circuit_name = 'high_speed_comparator'
    test_path = pathlib.Path(__file__).resolve().parent.parent / 'files' / 'test_circuits' / dir_name / (circuit_name + '.sp')
    with pytest.raises(CheckerError):
        updated_cktlib = compiler_input(test_path, circuit_name, pdk_dir, config_path)

def test_scf():
    mydir = pathlib.Path(__file__).resolve()
    test_path = mydir.parent.parent / 'files' / 'test_circuits' / 'switched_capacitor_filter' / 'switched_capacitor_filter.sp'
    gen_const_path = mydir.parent / 'Results' / 'SWITCHED_CAPACITOR_FILTER.verilog.json'
    gold_const_path = mydir.parent.parent / 'files' / 'test_results' / 'switched_capacitor_filter.const.json'

    updated_cktlib = compiler_input(test_path, "SWITCHED_CAPACITOR_FILTER", pdk_dir, config_path)
    assert updated_cktlib.find('SWITCHED_CAPACITOR_FILTER')
    result_path = out_path / 'switched_capacitor_filter'
    compiler_output(test_path, updated_cktlib, 'SWITCHED_CAPACITOR_FILTER', result_path, pdk_dir)
    gen_const_path = result_path / 'SWITCHED_CAPACITOR_FILTER.verilog.json'
    gold_const_path = pathlib.Path(__file__).resolve().parent.parent / 'files' / 'test_results' / 'switched_capacitor_filter.const.json'
    with open(gen_const_path, "r") as const_fp:
        gen_const = next(x for x in json.load(const_fp)['modules'] if x['name'] == 'SWITCHED_CAPACITOR_FILTER')["constraints"]
        gen_const.sort(key=lambda item: item.get("constraint"))
    with open(gold_const_path, "r") as const_fp:
        gold_const = json.load(const_fp)
        gold_const.sort(key=lambda item: item.get("constraint"))
    assert gold_const == gen_const

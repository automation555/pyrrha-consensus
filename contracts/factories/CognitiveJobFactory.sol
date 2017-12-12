pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import '../jobs/CognitiveJob.sol';
import '../entities/IDataEntity.sol';
import '../pandora/IPandora.sol';
import '../nodes/INode.sol';

contract CognitiveJobFactory is Ownable {
    function CognitiveJobFactory() public { }

    function create(
        IPandora _pandora,
        IKernel _kernel,
        IDataset _dataset,
        IWorkerNode[] _workersPool
    )
    onlyOwner
    external
    returns (CognitiveJob) {
        return new CognitiveJob(_pandora, _kernel, _dataset, _workersPool);
    }
}

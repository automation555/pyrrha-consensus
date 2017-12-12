pragma solidity ^0.4.18;

import '../factories/WorkerNodeFactory.sol';

contract IWorkerNodeManager {
    WorkerNodeFactory public workerNodeFactory;
    IWorkerNode[] public workerNodes;
    mapping(address => uint16) public workerAddresses;

    /// @notice Returns count of registered worker nodes
    function workerNodesCount() public view returns (uint);

    function createWorkerNode() external returns (IWorkerNode);
    function penaltizeWorkerNode(IWorkerNode guilty, IWorkerNode.Penalties reason) external;
    function destroyWorkerNode(IWorkerNode node) external;

    event WorkerNodeCreated(IWorkerNode workerNode);
    event WorkerNodeDestroyed(IWorkerNode workerNode);
}

import '../entities/IDataEntity.sol';
import '../nodes/INode.sol';
import '../jobs/IJob.sol';
import '../factories/CognitiveJobFactory.sol';

contract ICognitiveJobManager {
    CognitiveJobFactory public cognitiveJobFactory;
    mapping(address => ICognitiveJob) public activeJobs;

    function createCognitiveJob(IKernel kernel, IDataset dataset) external payable returns (ICognitiveJob);
    function finishCognitiveJob() external;

    event CognitiveJobCreated(ICognitiveJob cognitiveJob);
}

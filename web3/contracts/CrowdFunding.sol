// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowFunding {
    struct Campaign() {


        address owner;
        string title;
        string description;
        uint256 target;
        uint256 deadlin;
        unit256 amountCollected;
        string image;

        address[] donators;
        uint256[] donations;

        
    }


    mapping(unit256 => Campaign) public campaigns;

    unit256 public numberOfCampaigns = 0;

    function createCampaign(address _owner, string memory _title, string memory_description, uint256_target, unit256_deadline , string memory_imaage) 
    public returns (unit256){

            Campaign storage campaigns = campaigns[numberOfCampaigns];

            // is everything ok ?
            require(campaign.deadline < block.timepstamp, "The deadline should be a date in the future.");

            campaign.owner = _owner;
            campaign.title = _title;
            campaign.description = _description;
            campaign.target = _target;
            campaign.deadline = _deadline;
            campaign.amountCollected = 0;
            campaign.image = _image;
            
            numberOfCampaigns++;
            
            return numberOfCampaigns - 1;

    }
    }

    function donateToCampaign(uint256_id)public payable{

          uint amount = msg.value;

          Campaign storage campaign=campaigns[_id];

          Campaigns.donators.push(msg.sender);
          Campaigns.donations.push(amount);
          
          (bool sent,)=payable(Campaign.owner).call{value:amount}("");

          if(sent){
            campaign.amountCollected=campaign.amountCollected+amount;
          }
    }

    function getDonators(uint256_id)view public returns(address[] memory,unit256[] memory){
        return (campaigns[_id].donators,campaigns[_id].donations);
    }

    function getCampaigns()public view returns(campaigns[]memory){
      Campaing[] memory allCampaigns= new Campaign[](numberofCampaigns);

        for(uint i=0;i<numberofCampaigns;i++){
            Campaigns storage item= campaigns[i];

            allCampaigns[i]=item;
        }
        
        return allCampaigns;

    }

}
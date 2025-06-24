package com.bigpoint.zoomumba.constants
{
   public class NET
   {
      public static const PUSH:String = "*{\"push.get\":[]}";
      
      public static const GET_CONFIG:String = "*{\"config.getConfig\":[]}";
      
      public static const GET_CV_LIST:String = "*{\"config.getCv\":[]}";
      
      public static const GET_USER:String = "*{\"init.getUser\":{\"req:\":@}}";
      
      public static const SET_USER:String = "*{\"swfOpt.set\":%0}";
      
      public static const SWAP_CURRENCY:String = "*{\"user.swap\":{\"req:\":@, \"cR\":%0}}";
      
      public static const SWITCH_PLAYFIELD:String = "*{\"init.sP\":{\"req:\":@,\"fId\":%0, \"type\":%1}}";
      
      public static const GET_NEIGHBOUR:String = "{\"init.getNeighbour\":{\"req:\":@,\"uId\":%0}}";
      
      public static const REDEEM_BONUS_CODE:String = "*{\"coupon.redeem\":{\"req:\":@,\"code\":%0}}";
      
      public static const REDEEM_COLLECTION_SET_REWARD:String = "*{\"collection.rs\":{ \"req:\":@,\"type\":%0, \"id\":%1, \"rId\":%2 }}";
      
      public static const LOG_FLASH_ERROR:String = "{\"error.set\":{\"error\":%0}}";
      
      public static const BUY_FORTUNE_WHEEL_TICKET:String = "*{\"tombola.bTT\":[]}";
      
      public static const REDEEM_FORTUNE_WHEEL_TICKET:String = "*{\"tombola.rTT\":{\"req:\":@}}";
      
      public static const MOVE_ITEM_FROM_FIELD_TO_INVENTORY:String = "*{\"inventory.iva\":{\"req:\":@,\"iva\": \"fti\", \"type\": %0, \"id\": %1, \"cnt\": 1}}";
      
      public static const MOVE_ANIMAL_FROM_FIELD_TO_INVENTORY:String = "*{\"inventory.iva\":{\"req:\":@,\"iva\": \"fti\", \"type\": %0, \"p\": %1}}";
      
      public static const MOVE_ITEM_FROM_INVENTORY_TO_FIELD:String = "*{\"inventory.iva\":{\"req:\":@,\"iva\":\"itf\", \"type\":%0, \"id\":%1, \"x\":%2, \"y\":%3, \"r\":%4}}";
      
      public static const MOVE_ANIMAL_FROM_INVENTORY_TO_CAGE:String = "*{\"inventory.iva\":{\"req:\":@,\"iva\":\"itf\", \"type\":11, \"id\":%0, \"cId\":%1}}";
      
      public static const REQUEST_INVENTORY:String = "*{\"inventory.iva\":{\"req:\":@,\"iva\":\"gui\"}}";
      
      public static const SELL_ITEM_FROM_INVENTORY:String = "*{\"inventory.iva\":{\"req:\":@,\"iva\": \"sfi\", \"type\": %0, \"ids\": %1}}";
      
      public static const MAIL_DELETE_ITEM:String = "*{\"mail.dm\":{\"req:\":@, \"id\": %0, \"boxType\": %1}}";
      
      public static const MAIL_GET_INBOX:String = "*{\"mail.gib\":{\"req:\":@, \"from\": %0, \"to\": %1}}";
      
      public static const MAIL_GET_OUTBOX:String = "*{\"mail.gob\":{\"req:\":@, \"from\": %0, \"to\": %1}}";
      
      public static const MAIL_IS_READ:String = "*{\"mail.rm\":{\"req:\":@, \"id\":[%0] }}";
      
      public static const MAIL_SEND_BY_ID:String = "*{\"mail.sm\":{\"req:\":@, \"rId\":%0, \"head\":%1, \"body\":%2 }}";
      
      public static const BUY_PROMO_PACK:String = "*{\"packs.buy\":{\"req:\":@,\"pId\":%0, \"uIds\":%1}}";
      
      public static const REDEEM_GIFT:String = "*{\"gifts.redeem\":{\"req:\":@,\"gId\":%0}}";
      
      public static const CANCEL_QUEST:String = "*{\"quest.cQ\":{\"req:\":@,\"id\":%0}}";
      
      public static const FINISH_QUEST:String = "*{\"quest.gR\":{\"req:\":@,\"id\":%0}}";
      
      public static const GET_ACHIEVEMENTS:String = "*{\"achievement.ga\":{}}";
      
      public static const BUY_NEW_QUESTS:String = "*{\"quest.gNQ\":{}}";
      
      public static const GET_QUESTS:String = "*{\"quest.gQ\":{}}";
      
      public static const START_QUEST:String = "*{\"quest.sQ\":{\"req:\":@,\"id\":%0}}";
      
      public static const GET_RANKING_LIST:String = "{\"rankings.get\":{\"req:\":@,\"type\":%0}}";
      
      public static const BUY_SAFARI_FUEL:String = "*{\"safari.bG\":{\"req:\":@,\"amt\":%0}}";
      
      public static const SAFARI_BUY_JOKER:String = "*{\"safari.bJ\":{\"req:\":@,\"jId\":%0, \"jT\":1 }}";
      
      public static const SAFARI_END:String = "*{\"safari.eG\":[]}";
      
      public static const EXPLORE_SAFARI_TILE:String = "*{\"safari.eA\":{\"req:\":@, \"x\":%0, \"y\":%1 }}";
      
      public static const GET_SAFARI_CONFIG:String = "*{\"safari.gC\":{}}";
      
      public static const GET_SAFARI_SATE:String = "*{\"safari.gS\":{}}";
      
      public static const SKIP_SAFARI_TIMER:String = "*{\"safari.sT\":[]}";
      
      public static const START_SAFARI:String = "*{\"safari.sS\":{\"req:\":@, \"mId\":%0 }}";
      
      public static const USE_SAFARI_JOKER:String = "*{\"safari.uJ\":{\"req:\":@,\"jId\": %0, \"x\": %1, \"y\": %2}}";
      
      public static const TUTORIAL_STORE_STATS:String = "{\"tutorial.rS\":{\"req:\":@,\"s\":%0, \"t\":%1, \"f\":%2, \"sc\":%3 }}";
      
      public static const BUILD_CAGE_BUY:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"bdC\",\"id\":%0}}";
      
      public static const BUILD_DECO_BUY:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"bdD\",\"id\":%0}}";
      
      public static const BUILD_STORE_BUY:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"bdSt\",\"id\":%0}}";
      
      public static const POWER_FEED_ASSISTANT:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"uApfA\",\"asId\":%0}}";
      
      public static const SUPER_FEED_ASSISTANT:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"uAsfA\",\"asId\":%0}}";
      
      public static const SUPER_HEAL_ASSISTANT:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"uAshC\",\"asId\":%0}}";
      
      public static const USE_ASSISTANT:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"uA\",\"asId\":%0}}";
      
      public static const CLEAR_ASSISTANT_TIMER:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"cAt\",\"asId\":%0}}";
      
      public static const BUY_CAGE:String = "*{\"field.fia\":{\"req:\":@,\"cId\":%0,\"x\":%1,\"y\":%2,\"r\":%3,\"cR\":%4,\"fia\":\"bC\"}}";
      
      public static const BUY_DECO:String = "*{\"field.fia\":{\"req:\":@,\"dId\":%0,\"x\":%1,\"y\":%2,\"r\":%3,\"cR\":%4,\"fia\":\"bD\"}}";
      
      public static const BUY_PREMIUM:String = "*{\"field.fia\":{\"req:\":@,\"pId\":%0,\"fia\":\"bP\"}}";
      
      public static const BUY_PREMIUM_WITH_COUT:String = "*{\"field.fia\":{\"req:\":@,\"pId\":%0,\"fia\":\"bP\", \"cnt\":%1}}";
      
      public static const BUY_ASSISTANT:String = "*{\"field.fia\":{\"req:\":@,\"asId\":%0,\"cR\":%1, \"type\":%2, \"fia\":\"bAs\"}}";
      
      public static const BUY_RESOURCE:String = "*{\"field.fia\":{\"req:\":@,\"irId\":%0, \"cnt\":%1,\"cR\":%2, \"fia\":\"bIr\"}}";
      
      public static const BUY_ROAD:String = "*{\"field.fia\":{\"req:\":@,\"rId\":%0,\"x\":%1,\"y\":%2,\"r\":%3,\"cR\":%4,\"fia\":\"bR\"}}";
      
      public static const BUY_STORE:String = "*{\"field.fia\":{\"req:\":@,\"stId\":%0,\"x\":%1,\"y\":%2,\"r\":%3,\"cR\":%4,\"fia\":\"bSt\"}}";
      
      public static const BUY_TRASHBIN:String = "*{\"field.fia\":{\"req:\":@,\"tbId\":%0,\"x\":%1,\"y\":%2,\"r\":%3,\"cR\":%4,\"fia\":\"bTb\"}}";
      
      public static const BUY_BREEDING_LAB:String = "*{\"field.fia\":{\"req:\":@,\"sbId\":1,\"x\":%0,\"y\":%1,\"r\":%2,\"cR\":%3,\"fia\":\"bSB\"}}";
      
      public static const BUY_NURSERY:String = "*{\"field.fia\":{\"req:\":@,\"sbId\":2,\"x\":%0,\"y\":%1,\"r\":%2,\"cR\":%3,\"fia\":\"bSB\"}}";
      
      public static const BUY_ANIMAL_TO_INVENTORY:String = "*{\"field.fia\":{\"req:\":@, \"aId\":%0, \"cR\":%1, \"fia\":\"bAInv\"}}";
      
      public static const BUY_POWERUP_SHOP:String = "*{\"item.buyPU\":{\"req:\":@,\"id\":%0, \"cnt\":%1}}";
      
      public static const BABY_EVENT_TRADE_COLLECTABLE:String = "*{\"caravan.wTp\":{\"req:\":@,\"id\":1, \"itemId\":%0, \"amount\":%1}}";
      
      public static const BABY_EVENT_REDEEM:String = "*{\"caravan.redeem\":{\"req:\":@,\"id\":%0, \"rId\":%1}}";
      
      public static const BABY_CARAVAN_FINISH:String = "*{\"loan.dI\":{\"req:\":@,\"items\":%0}}";
      
      public static const BREED_END:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"beAC\",\"id\":%0}}";
      
      public static const BREED_START:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"bsAC\",\"id\":%0}}";
      
      public static const BUY_ANIMAL_CAGE:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"bAC\",\"id\":%0, \"aId\":%1, \"cR\":%2}}";
      
      public static const CLEAN_ANIMAL_CAGE:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"cAC\",\"id\":%0}}";
      
      public static const CUDDLE_ANIMAL_CAGE:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"cuAC\",\"id\":%0}}";
      
      public static const DIRECT_BREED:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"bdAC\",\"id\":%0}}";
      
      public static const FEED_ANIMAL_CAGE:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"fAC\",\"id\":%0}}";
      
      public static const WATER_ANIMAL_CAGE:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"wAC\",\"id\":%0}}";
      
      public static const HEAL_ANIMAL_CAGE:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"hAC\",\"id\":%0}}";
      
      public static const MOVE_ANIMAL_CAGE:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"mAC\",\"aId\":%0, \"idt\":%1, \"idf\":%2}}";
      
      public static const POWER_FEED_ANIMAL_CAGE:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"pfAC\",\"id\":%0}}";
      
      public static const SUPER_FEED_ANIMAL_CAGE:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"sfAC\",\"id\":%0}}";
      
      public static const SUPER_HEAL_ANIMAL_CAGE:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"shAC\",\"id\":%0}}";
      
      public static const SELL_ANIMAL_CAGE:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"sAC\",\"id\":%0, \"aId\":%1}}";
      
      public static const UPGRADE_CAGE:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"uc\",\"id\":%0}}";
      
      public static const UPGRADE_EVENT_CAGE:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"uCa\",\"id\":%0, \"eId\":%1}}";
      
      public static const COLLECT_ENTRANCE_FEE:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"cEf\"}}";
      
      public static const DEBUG_PHP_ACTION:String = "{\"test.testAdam\":{\"req:\":@,\"id\":%0}}";
      
      public static const MOVE_CAGE:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"mC\",\"id\":%0,\"x\":%1,\"y\":%2,\"r\":%3}}";
      
      public static const MOVE_DECO:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"mD\",\"id\":%0,\"x\":%1,\"y\":%2,\"r\":%3}}";
      
      public static const MOVE_ROAD:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"mR\",\"id\":%0,\"x\":%1,\"y\":%2,\"r\":%3}}";
      
      public static const MOVE_STORE:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"mSt\",\"id\":%0,\"x\":%1,\"y\":%2,\"r\":%3}}";
      
      public static const MOVE_TRASH_BIN:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"mTb\",\"id\":%0,\"x\":%1,\"y\":%2,\"r\":%3}}";
      
      public static const MOVE_NURSERY:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"mSB\",\"id\":%0,\"x\":%1,\"y\":%2,\"r\":%3}}";
      
      public static const MOVE_BREEDING_LAB:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"mSB\",\"id\":%0,\"x\":%1,\"y\":%2,\"r\":%3}}";
      
      public static const SELL_CAGE:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"sC\",\"id\":%0}}";
      
      public static const SELL_DECO:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"sD\",\"id\":%0}}";
      
      public static const SELL_ROAD:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"sR\",\"id\":%0}}";
      
      public static const SELL_STORE:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"sSt\",\"id\":%0}}";
      
      public static const SELL_TRASH_BIN:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"sTb\",\"id\":%0, \"cnt\":%1}}";
      
      public static const SELL_SPECIAL_ITEM:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"sSB\",\"id\":%0}}";
      
      public static const GET_SPECIALS_DATA:String = "*{\"field.getSpecials\":{\"req:\":@}}";
      
      public static const ADVANCED_BREEDING_EVENT_CONFIG:String = "{\"advBreedEvt.getConfig\":{\"req:\":@}}";
      
      public static const ADVANCED_BREEDING_EVENT_REDEEM:String = "*{\"advBreedEvt.redeem\":{\"req:\":@, \"data\":%0}}";
      
      public static const CIRCUS_BUY_BOX:String = "*{\"circus.bMc\":{\"req:\":@, \"x\":%0, \"y\":%1}}";
      
      public static const CIRCUS_OPEN_BOX:String = "*{\"circus.oMb\":{\"id\":%0}}";
      
      public static const COLLECT_STORE_MONEY:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"cSt\",\"id\":%0}}";
      
      public static const CLEAR_TRASH_BIN:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"cTb\",\"id\":%0, \"cnt\":%1}}";
      
      public static const CLEAR_TRASH_ROAD:String = "{\"field.fia\":{\"req:\":@,\"fia\":\"cTr\",\"cnt\":%0}}";
      
      public static const SAVE_FLASH_COOKIE:String = "*{\"swfCookie.set\":%0}";
      
      public static const SAVE_ACTIV_MAIN_BUILDING:String = "*{\"field.fia\":{\"req:\":@,\"fia\":\"sEb\",\"id\":%0, \"fId\":%1}}";
      
      public static const FRIENDS_FRIENDSHIPS:String = "*{\"friends.gFs\":{\"req:\":@}}";
      
      public static const FRIENDS_INVITATIONS_RECEIVED:String = "*{\"friends.gFrI\":{\"req:\":@}}";
      
      public static const FRIENDS_INVITATIONS_SENT:String = "*{\"friends.gFsI\":{\"req:\":@}}";
      
      public static const FRIENDS_INVITE_FRIEND:String = "*{\"friends.iFbI\":{\"req:\":@,\"uId\":%0}}";
      
      public static const FRIENDS_ACCEPT_FRIEND:String = "*{\"friends.aFbI\":{\"req:\":@,\"uId\":%0}}";
      
      public static const FRIENDS_DECLINE_FRIEND:String = "*{\"friends.dFbI\":{\"req:\":@,\"uId\":%0}}";
      
      public static const FRIENDS_CANCEL_FRIENDSHIP:String = "*{\"friends.cFbI\":{\"req:\":@,\"uId\":%0}}";
      
      public static const SEARCH_USER_BY_NAME:String = "*{\"user.uBN\":{\"req:\":@, \"uName\":%0}}";
      
      public static const AVATAR_SAVE:String = "*{\"avatar.set\":{\"req:\":@, \"fa\":%0, \"ha\":%1, \"ey\":%2, \"mo\":%3, \"ht\":%4, \"cl\":%5, \"bg\":%6}}";
      
      public static const AVATAR_GET:String = "*{\"avatar.get\":{\"req:\":@}}";
      
      public static const AVATAR_GET_CONFIG:String = "*{\"avatar.getConfig\":{\"req:\":@}}";
      
      public static const BABY_CARAVAN_DO_LOAN:String = "*{\"loan.gI\":{\"req:\":@, \"id\":%0}}";
      
      public static const START_ADVANCED_BREEDING_NET:String = "*{\"field.fia\":{\"req:\":@, \"id\":%0, \"aIdM\":%1, \"aIdF\":%2, \"items\":%3, \"fia\":\"bsASB\"}}";
      
      public static const END_ADVANCED_BREEDING_NET:String = "*{\"field.fia\":{\"req:\":@, \"id\":%0, \"fia\":\"beASB\"}}";
      
      public static const USE_ELIXIR:String = "*{\"field.fia\":{\"req:\":@, \"id\":%0, \"fia\":\"bdASB\"}}";
      
      public static const USE_RAISING_POTION:String = "*{\"field.fia\":{\"req:\":@, \"id\":%0, \"fia\":\"arASB\"}}";
      
      public static const START_NURSERY_BREEDING:String = "*{\"field.fia\":{\"req:\":@, \"id\":%0, \"aId\":%1, \"fia\":\"rsASB\"}}";
      
      public static const EXPLODE_BALLONS:String = "*{\"boardgame.explodeBallon\":{\"req:\":@, \"eventId\":%0}}";
      
      public static const EXPLODE_BALLONS_TYPE:String = "*{\"boardgame.explodeBallon\":{\"req:\":@, \"eventId\":%0, \"type\":%1}}";
      
      public static const END_NURSERY_BREEDING:String = "*{\"field.fia\":{\"req:\":@, \"id\":%0, \"fia\":\"reASB\"}}";
      
      public static const INSTANT_NURSERY_BREEDING:String = "*{\"field.fia\":{\"req:\":@, \"id\":%0, \"aId\":%1, \"fia\":\"rdASB\"}}";
      
      public static const XMAS_GIVE_REINDEED_TO_SANTA_CLAUS:String = "*{\"xmas.dR\":{\"req:\":@, \"aId\":%0}}";
      
      public static const XMAS_REDEEM_TREE:String = "*{\"xmas.redeem\":{\"req:\":@}}";
      
      public static const VALENTINES_GET_CONFIG:String = "*{\"valentine.getConfig\":{\"req:\":@}}";
      
      public static const VALENTINES_MAKE_A_MOVE:String = "*{\"valentine.move\":{\"req:\":@, \"id\":%0, \"cr\":%1}}";
      
      public static const VALENTINES_REDEEM:String = "*{\"valentine.redeem\":{\"req:\":@,  \"id\":%0}}";
      
      public static const VALENTINES_RESET:String = "*{\"valentine.reset\":{\"req:\":@}}";
      
      public static const EASTER_PUT_EGG:String = "*{\"easter.putEgg\":{\"req:\":@}}";
      
      public static const EASTER_GET_EVENT:String = "*{\"easter.getEvent\":{\"req:\":@}}";
      
      public static const EASTER_BUY_EGG:String = "*{\"easter.buyEgg\":{\"req:\":@}}";
      
      public static const FROG_PUT_DROPICON:String = "*{\"frog.putDrop\":{\"req:\":@}}";
      
      public static const FROG_GET_EVENT:String = "*{\"frog.getEvent\":{\"req:\":@}}";
      
      public static const FROG_BUY_DROPICON:String = "*{\"frog.buyDrop\":{\"req:\":@}}";
      
      public static const FROG_BUY_ANNIVERSARY:String = "*{\"frog.swapBalloons\":{\"req:\":@}}";
      
      public static const BOARDGAME_GET:String = "*{\"boardgame.get\":{\"req:\":@, \"eventId\":%0}}";
      
      public static const BOARDGAME_BUY:String = "*{\"boardgame.buy\":{\"req:\":@, \"eventId\":%0, \"type\":%1}}";
      
      public static const BOARDGAME_PUT:String = "*{\"boardgame.put\":{\"req:\":@, \"eventId\":%0, \"stepId\":%1, \"instantBuyReal\":%2}}";
      
      public static const BOARDGAME_PUT_INSTANT_BUY:String = "*{\"boardgame.put\":{\"req:\":@, \"eventId\":%0, \"stepId\":%1, \"instantBuyReal\":%2, \"leftPrice\":%3}}";
      
      public static const UNLOCK_FIELD:String = "*{\"field.ul\":{\"req:\":@, \"t\":%0}}";
      
      public static const MANAGMENTCENTER_UPGRADE:String = "*{\"managementCenter.upgrade\":{\"req:\":@, \"building\":%0, \"instantBuyReal\":%1}}";
      
      public static const HALLOWEEN2012_PUT_DROPICON:String = "*{\"halloween2012.putDrop\":{\"req:\":@, \"t\":%0, \"a\":%1}}";
      
      public static const HALLOWEEN2012_GET_EVENT:String = "*{\"halloween2012.getEvent\":{\"req:\":@}}";
      
      public static const HALLOWEEN2012_BUY_DROPICON:String = "*{\"halloween2012.buyDrop\":{\"req:\":@, \"type\":%0}}";
      
      public static const COMMUNITY_PAYIN_GET_EVENT:String = "*{\"communityPayin.getEvent\":{\"req:\":@, \"eventId\":%0}}";
      
      public static const COMMUNITY_PAYIN_PUTDROP:String = "*{\"communityPayin.putDrop\":{\"req:\":@, \"aids\":%0}}";
      
      public static const COMMUNITY_PAYIN_REDEEM:String = "*{\"communityPayin.redeem\":{\"req:\":@, \"s\":%0}}";
      
      public static const XMAS2012_PUT_DROP:String = "*{\"xmas2012.putDrop\":{\"req:\":@, \"t\":%0, \"a\":%1, \"aids\":%2}}";
      
      public static const XMAS2012_GET_EVENT:String = "*{\"xmas2012.getEvent\":{\"req:\":@}}";
      
      public static const XMAS2012_BUY_DROPICON:String = "*{\"xmas2012.buyDrop\":{\"req:\":@, \"type\":%0}}";
      
      public static const INVENTORY_GET:String = "*{\"inv.get\":{\"req:\":@}}";
      
      public static const SHOP_ITEMS_GET:String = "*{\"gameitems.get\":{\"req:\":@}}";
      
      public static const MANAGMENT_CENTER_GET:String = "*{\"managementCenter.get\":{\"req:\":@}}";
      
      public static const MOVE_ITEMS_TO_INVENTORY:String = "*{\"field.moveItemsToInventory\":{\"req:\":@}}";
      
      public static const RECYCLE_GET_SLOTS:String = "*{\"recyclingCenter.grs\":{\"req:\":@}}";
      
      public static const RECYCLE_INSTANT_COLLLECT_RECYCLE_SLOT:String = "*{\"recyclingCenter.icrs\":{\"req:\":@, \"slotId\":%0}}";
      
      public static const RECYCLE_COLLLECT_RECYCLE_SLOT:String = "*{\"recyclingCenter.crs\":{\"req:\":@, \"slotId\":%0}}";
      
      public static const RECYCLE_BOOK_NEW_SLOT:String = "*{\"recyclingCenter.brs\":{\"req:\":@, \"slotId\":%0, \"days\":%1}}";
      
      public static const RECYCLE_START_RECYCLE_MATERIAL:String = "*{\"recyclingCenter.srm\":{\"req:\":@, \"slotId\":%0, \"materialId\":%1, \"amount\":%2, \"useBooster\":%3}}";
      
      public static const RECYCLE_BUY_SURPRISEBOX:String = "*{\"item.buySB\":{\"req:\":@,\"id\":%0}}";
      
      public static const CRAFTING_START:String = "*{\"craftingCenter.sbc\":{\"req:\":@,\"blueprintId\":%0}}";
      
      public static const CRAFTING_GET_REWARD:String = "*{\"craftingCenter.gac\":{\"req:\":@}}";
      
      public static const CRAFTING_COLLECT:String = "*{\"craftingCenter.cbc\":{\"req:\":@}}";
      
      public static const CRAFTING_COLLECT_INSTANT:String = "*{\"craftingCenter.icbc\":{\"req:\":@}}";
      
      public static const CRAFTING_TIME_DECREASE:String = "*{\"craftingCenter.dbct\":{\"req:\":@}}";
      
      public static const EXTEND_FORGOTTEN_ZOO_TOOLS_BUY:String = "*{\"field.eFbC\":{\"req:\":@, \"tools\":%0, \"zd\":%1}}";
      
      public function NET()
      {
         super();
      }
   }
}


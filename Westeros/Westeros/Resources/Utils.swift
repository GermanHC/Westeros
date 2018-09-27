//
//  Utils.swift
//  Westeros
//
//  Created by German Hernandez on 27/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import Foundation
typealias EpisodeNum = Int

final class Utils{
   static func getRecap(recapEpisodeNum: EpisodeNum)-> String{
        switch recapEpisodeNum {
        case 1:
            return "In the Seven Kingdoms of Westeros, a soldier of the ancient Night's Watch order survives an attack by supernatural creatures known as the White Walkers, thought until now to be myth. He rushes to Castle Winterfell, which is ruled by Eddard \"Ned\" Stark, Warden of the North, who decapitates the soldier for deserting his post. In King's Landing, the capital, Jon Arryn, the \"Hand of the King\", dies under mysterious circumstances. King Robert Baratheon, Ned's longtime friend, travels to Winterfell, offering the position to him and also proposing marriage between his firstborn son Joffrey and Ned's older daughter Sansa. Ned's wife Catelyn receives a letter from her sister Lysa, Jon Arryn's widow, saying that she has escaped King's Landing and that Jon was murdered by the Lannisters, Queen Cersei's family. Catelyn burns the letter and tells Ned about it, believing that the Lannisters are plotting against Robert. Ned's 10-year-old son, Brandon, climbs a tower, where he witnesses Cersei having sex with her twin brother, Jaime, who then pushes him out the window from a presumably fatal height. Meanwhile across the narrow sea in Essos, the exiled Prince Viserys Targaryen makes a deal with the Dothraki warlord Khal Drogo, who marries Viserys' younger sister, Daenerys, in exchange for an army to conquer Westeros and reclaim the Iron Throne."
        case 2:
            return "Having accepted his new role as the Hand of the King, Ned leaves Winterfell with his daughters Sansa and Arya, while Catelyn stays behind to tend to Bran. The unconscious Bran is attacked by an assassin, but his direwolf saves him. Catelyn decides to go to King's Landing to tell Ned about the attempt and suspected Lannister involvement. Jon Snow, Ned's illegitimate son, heads north to join the brotherhood of the Night's Watch, protectors of the Wall that keeps the White Walkers and the wildlings from entering civilized Westeros. Tyrion, Cersei's brother, decides to forgo the trip south with his family and instead accompanies Snow's entourage to the Wall. When Joffrey threatens Arya and her friend, Arya's direwolf defends her and escapes, provoking a conflict between the Starks and the Lannisters. To resolve the insult, Cersei demands that Robert order Ned to execute Sansa's direwolf. In Winterfell, Brandon awakens from unconsciousness. Meanwhile, Daenerys focuses her attention on learning how to please Drogo."
        case 3:
            return "Ned joins the King's Small Council at King's Landing, capital of the Seven Kingdoms, and learns just how poorly Westeros is being managed. Catelyn tries to covertly warn her husband, but is intercepted by an old friend, Councillor Petyr \"Littlefinger\" Baelish. Bran learns he will never walk again. He does not remember the events leading to his fall. Jon struggles to adapt to life on the Wall, as he trains with a number of low-born recruits who are not impressed by his bloodline. Lord Commander Mormont asks Tyrion to plead with the King to send more men to the Night's Watch. Daenerys learns that she is pregnant, and begins to stand up to Viserys."
        case 4:
            return "Tyrion shares saddle modifications for Bran that will allow the paraplegic boy to ride before heading south. Ned searches for clues to the unexplained death of his mentor and predecessor Jon Arryn and in the process uncovers King Robert's illegitimate son. Robert and his guests witness a tournament honoring Ned. Jon takes measures to protect Samwell Tarly, an awkward and friendless boy, from the abuse of the Night's Watchmen. A frustrated Viserys clashes with his newly empowered sister. Sansa dreams of life as a queen, while Arya envisions a far different future. At a chance encounter in a roadside tavern, Catelyn rallies her father's allies and has Tyrion arrested for conspiring to murder her son."
            
        case 5:
            return "Ned refuses to participate in Robert's plan to assassinate the pregnant Daenerys Targaryen, and resigns as Robert's Hand, angering him. Catelyn and Tyrion (whom she has taken as her prisoner) arrive at her sister Lysa's home in the Eyrie. News of Tyrion's capture reaches King's Landing where Jaime Lannister, the Queen's twin brother, demands answers from Ned. A vengeful Jaime fights Ned until his man stabs Ned in the leg from behind, leaving him wounded as his forces leave the capital."
        case 6:
            return "Robert reappoints Ned as Hand and tasks him with running affairs until he returns from hunting. Villagers from Riverrun arrive in the throne room with news of atrocities committed by raiders, who Ned deduces were led by Gregor Clegane, a Lannister retainer. Ned sentences Gregor to death and sends a message to Tywin Lannister, summoning him to a trial. Ned decides to send Sansa, (now reconciled with Joffrey), and Arya back to Winterfell. Ned finds out that Joffrey is not Robert's biological son. While out testing his new saddle, Bran is attacked by outlaws. Robb, Ned's oldest son, and Theon, the fostered son of a fallen rebel king, save him. In the Vale, Tyrion demands a trial by combat, which Lysa accepts. She chooses Ser Vardis and Tyrion asks for a champion. The mercenary Bronn volunteers, killing Vardis and thereby obtaining Tyrion's release. Meanwhile, Viserys becomes enraged with Drogo for not honoring his promise and threatens to kill Daenerys' unborn child. Drogo kills Viserys by pouring molten gold on his head."
        case 11:
            return "To Cersei's dismay, Tyrion takes up his post as acting Hand at King's Landing. At Dragonstone, Stannis proclaims allegiance to Melisandre's new god and lays public claim to the Iron Throne, revealing Joffrey's bastardy. The latter orders the soldiers to slaughter Robert's bastards, one of whom, named Gendry, manages to escape King's Landing along with Arya. Having won three victories, Robb offers the Lannisters peace in exchange for the North's independence and Sansa's return, sending Theon to gain the support of Balon, his father, and Catelyn to seek alliance with Renly, who also claims the throne. Beyond the Wall, the Night's Watch finds shelter with Craster and his daughters/wives. In Essos, as her people slowly die in the Red Waste, Daenerys sends out riders for reconnaissance."
        case 12:
            return "Returning to his home of Pyke after nine years as the Starks' ward, Theon is reunited with his sister, Yara, and Balon, who despises Theon for his Northern ways and intends to win back his crown by force. Cersei rejects Robb's terms and Tyrion exiles Slynt, head of the Gold Cloaks, to the Wall, promoting Bronn to commander of the watch. On the road to the Wall, Arya reveals her true identity to Gendry. North of the Wall, Tarly is approached by one of Craster's daughters, Gilly, who is pregnant and fears for her unborn son; Snow is reluctant to help her despite Tarly's pleas. In the Red Waste, one of the horses returns to Daenerys with the severed head of its rider in a pouch, a message from one of her enemies. In Dragonstone, Davos, Stannis's henchman, recruits the pirate Salladhor Saan to Stannis' side, and the latter has sex with Melisandre to obtain the son his wife cannot give him. Snow discovers that Craster sacrifices his sons to the White Walkers; in response, Craster knocks Snow unconscious."
        case 13:
            return "Catelyn arrives at Renly's camp to negotiate an alliance, watching the female warrior Brienne of Tarth winning the right to join Renly's guard. Renly has recently married Margaery, Loras's sister, but refuses to have sex with her due to having feelings for Loras. In the Iron Islands, Balon makes a plan to attack the North, led by Yara. After burning a letter warning Robb of Balon's impending attack, Theon re-joins the Greyjoys in a water-based ceremony. In King's Landing, Tyrion crafts a plan to find who is in Cersei's confidence; finding it to be Pycelle, whom the former imprisons. Tyrion assigns his prostitute, Shae, as handmaiden to Sansa. Beyond the Wall, Craster demands the Night's Watchmen leave. Snow finds out that Jeor already knew about Craster's felonies. On the road to the wall, the band of Night's Watch recruits are attacked by Lannister soldiers. Yoren is killed and Arya is taken prisoner. The latter states that Gendry was a boy already killed."
        case 14:
            return "Catelyn tries to convince the Baratheon brothers to abandon their quarrel and unite against the Lannisters; but Stannis demands Renly submit to his command. Baelish visits her and offers a trade of Jaime for her daughters. Melisandre gives birth to a shadow creature. Sansa is abused by Joffrey in revenge for Robb's victories. Tyrion intervenes and in return, Joffrey is cruel to the prostitutes Tyrion sends him as \"gifts\". Tyrion releases Pycelle, but fires him from the Small Council. Tyrion also finds out about the incestuous relationship between Cersei and their cousin, Lancel, forcing the latter to spy on her by threatening to reveal it to Joffrey. Arya and Gendry are taken as captives to the castle of Harrenhal, where prisoners are tortured until death. Tywin arrives and stops the torture, picking her as his servant without knowing about her true identity. After her exhausting journey through the desert, Daenerys arrives at the gates of the prosperous city of Qarth, where Daxos, a member of the Council of Thirteen, convinces the others to let her caravan enter the city."
        case 21:
            return "Some of the Night's Watchmen, including Tarly and Mormont, survive the White Walkers' attack and pledge to return to the Wall to warn the Seven Kingdoms. Snow is brought before Rayder, the \"King beyond the Wall\", and pledges his loyalty to the Wildlings. A scarred Tyrion tries to get Casterly Rock from Tywin, who promises other things instead. Margaery engages in charity work with the orphans of King's Landing. Baelish offers to help Sansa escape King's Landing. Ros advises Shae not to trust him. Davos is rescued by Saan, who does not want any more connections with Stannis, and returns to Dragonstone, where he unsuccessfully tries to kill Melisandre, who blames him for convincing Stannis not to let her join the battle, and is imprisoned. In Essos, Daenerys arrives in the city of Astapor to buy an army of brutally-trained slave soldiers, the \"Unsullied\". The warlocks of Qarth attempt to assassinate her, but she is saved by Selmy, the former Kingsguard commander, who pledges his loyalty."
        case 22:
        return "Brienne continues escorting Jaime across the Riverlands to King's Landing. He engages her in a fight, which is interrupted by Bolton soldiers. After receiving the news of the sack of Winterfell and the disappearance of Bran and Rickon, Robb diverts his attentions from the war against the Lannisters to attend Catelyn's father's funeral in Riverrun, angering Karstark, who seeks vengeance for his sons who were killed by the Lannisters. Arya, Gendry and Hot Pie also make for Riverrun, but are waylaid by a rebel group, the \"Brotherhood without Banners\", and are taken to an inn, where the captured Clegane reveals Arya's identity. Margaery and her grandmother Olenna, the \"Queen of Thorns\", convince Sansa to tell them about Joffrey's flawed character. Theon is tortured by unknown captors. Bran, Rickon, Osha and Hodor encounter the siblings Jojen and Meera, children of the Stark bannerman Howland. Jojen, who has been sharing Bran's strange dreams, tells him that he is a warg, able to enter the minds of animals."
        case 31:
            return "Tywin oversees the reforging of Ice, the Stark ancestral sword, into two new swords, one for Jaime, who tries to deal with the loss of his sword hand and Cersei's love, and one for King Joffrey as a wedding present. Prince Oberyn Martell, on behalf of his brother, Prince Doran of Dorne, arrives in King's Landing with his paramour, Ellaria Sand, to attend the royal wedding and is welcomed by Tyrion. Oberyn openly reveals to Tyrion his motive for his visit: revenge against the Lannisters for the rape and murder of his sister, Elia, wife of Prince Rhaegar. In the North, while Styr and his group of cannibal Thenns reinforce Tormund, Ygritte, and the other wildlings, Jon is released by Maester Aemon after confessing what he did during his time with the wildlings to gain information. In the Riverlands, Arya and the Hound reclaim her sword, Needle, from Polliver, killing him and his men. In Essos, Daenerys leads her army on a march towards Meereen, the last of the three great slave cities, though she is troubled by how her dragons are becoming less tame as they grow."
        case 32:
            return "Roose Bolton returns to the Dreadfort, where he criticizes Ramsay for mistreating Theon, who has been brutalized into a subservient persona called 'Reek'. The former decides to find and kill the remaining Stark children, Bran and Rickon, who threaten the legitimacy of his new title, while tasking Ramsay to reclaim the territories under Ironborn occupation. In Dragonstone, Melisandre orders several people to be burned as a tribute to the Lord of Light, to the delight of Queen Selyse and the disgust of Davos and Shireen. In King's Landing, Tyrion ends his relationship with Shae to protect her from his family and has her shipped off to Pentos. Jaime begins training his left-handed swordplay with the help of Bronn. King Joffrey and Margaery Tyrell are wed. Later, at the Royal Wedding feast, tensions between Joffrey and Tyrion grow—just before the former succumbs to poisoned wine and dies. A grief-stricken Cersei accuses Tyrion of the murder and has him arrested, while Ser Dontos, a former knight, advises Sansa to leave with him in order to survive."
        case 41:
            return "In a flashback, a witch tells a teenage Cersei that someone younger and more beautiful than herself will one day steal her accomplishments. In the present, Tywin is buried and Lancel returns, now a devoutly religious man and a member of the \"Sparrows\". In Pentos, a despondent Tyrion agrees to accompany Varys to Meereen to support Daenerys's claim on the Iron Throne. In Meereen, the insurgent \"Sons of the Harpy\" murder an Unsullied, forcing Daenerys to launch more restrictive measures without respecting the old traditions. Missandei gets suspicious when she realizes that the Unsullied visit brothels. Daenerys's locked-away dragons attack her when she checks on them. In the Vale, Baelish puts Robin in the care of House Royce and leaves with Sansa. At the Wall, Stannis seeks to enlist the Wildlings in his war against Roose. Jon Snow is unable to convince Rayder to accept Stannis's authority. The latter has Mance burned alive, but Jon Snow mercifully shoots him with an arrow to kill him quickly."
        case 42:
            return "Arya arrives in Braavos and is accepted into the \"House of Black and White\" by H'ghar, who calls himself and his colleagues \"no one\". Jaime tells Cersei he is going to Dorne to sneak out Myrcella, who is promised to Prince Doran's son, and recruits Bronn to assist him; Podrick recognises Baelish and Sansa in a tavern; Brienne offers Sansa her protection, but is rebuffed. Baelish demands her to stay with them, but she refuses and escapes with Podrick. However, she decides to follow Sansa secretly. Stannis offers Snow legitimacy and lordship of Winterfell if he leaves the Night's Watch to help him, but Snow declines; Tarly nominates him as a candidate for Lord Commander, and he is elected by the casting vote of Aemon. Daenerys faces a riot after she decides to execute a former slave who murdered a captured member of the Sons of the Harpy before he could be tried. Drogon reappears to her, but leaves again."
        case 51:
            return "Jon Snow's corpse is found by Ser Davos, Edd and a few other loyalists; Davos and the others take him inside and lock themselves behind a door with him, while Edd goes to get help. Thorne assumes command of the Watch. At Winterfell, Ramsay mourns for Myranda, while Sansa and Theon escape through the woods. Ramsay's men catch up with them, and are about to take them captive, when Brienne and Pod arrive, kill the men, and the former is accepted into Sansa's service. In King's Landing, Cersei receives Jaime, who arrives with Myrcella's body. Jaime promises Cersei they will take their revenge. Obara and Nymeria murder Trystane, on his way home from King's Landing, while in Sunspear, Doran and Areo Hotah are killed by Ellaria and Tyene, after the former learns of Myrcella's death. In Meereen, Tyrion and Varys find all the ships burning in the harbor. Jorah and Daario continue to track Daenerys, who is taken by the Dothraki to Khal Moro. In Braavos, Arya lives on the streets as a beggar, where she is beaten by the Waif. In her chamber, Melisandre removes her bejeweled necklace as she reveals her true appearance as an old crone."
        case 52:
            return "Brandon visits Winterfell in a vision of the past, and sees Eddard, Benjen, and their sister Lyanna, as well as a young Hodor. Edd arrives with Tormund and a group of Wildlings, imprisoning Thorne and the other mutineers. Tommen asks Cersei to teach him to be strong. Tyrion learns that Astapor and Yunkai have reverted to slavery, and releases Rhaegal and Viserion from their chains. In Braavos, Arya is attacked by the Waif before H'ghar appears and recruits her again. Walda, Roose's wife, gives birth to a boy, prompting Ramsay to murder Roose, her, and the baby. Brienne reveals to Sansa that Arya is still alive. Sansa permits Theon's return to the Iron Islands, where his uncle Euron reappears and murders King Balon. Davos persuades Melisandre to attempt to resurrect Jon. At first, her attempts seem to fail. However, once everyone leaves the room, he awakens."
        case 61:
            return "At the Twins, Arya fatally poisons the remaining lords of House Frey. The White Walkers march toward the Wall, where Tollett allows Bran and Meera inside. At Winterfell, despite Sansa's disapproval, Jon secures the loyalties of Houses Umber and Karstark, who fought alongside Ramsay in the Battle of the Bastards. At the Citadel, Samwell steals books that reveal a large reservoir of dragonglass in Dragonstone, and sends word to Jon. He later finds Jorah in a cell. In the Riverlands, Arya meets a group of friendly Lannister soldiers, who take her intention to kill Cersei as a joke. Thoros shows Sandor a vision in the fire. The revelation leads him to believe in the Lord of Light. In King's Landing, Jaime tells Cersei of the crucial need for allies. She welcomes Euron, who proposes marriage to her in exchange for his Iron Fleet and a chance to kill Theon and Yara. Cersei declines, citing trust as a concern, so Euron promises to return with a \"gift\" to prove his loyalty. Daenerys arrives at Dragonstone, the home of House Targaryen once occupied by Stannis, with her army and dragons."
        case 62:
            return "Daenerys sends the Dornishmen with Yara's fleet to Sunspear and the Unsullied to Casterly Rock, deciding to place King's Landing under siege. She questions Varys' loyalty and threatens to burn him alive if he ever betrays her. Melisandre arrives and encourages her to invite Jon Snow to Dragonstone. Grey Worm and Missandei consummate their relationship. Cersei gathers several lords, asking for their fealties and elevating Randyll Tarly as Warden of the South. Qyburn shows Cersei a prototype ballista capable of harming dragons. Arya meets with Hot Pie and learns of Jon's ascension to King in the North, halting plans to travel to King's Landing and instead setting course for Winterfell. After receiving Samwell's letter, Jon leaves for Dragonstone in hopes of convincing Daenerys to support the fight against the White Walkers. He leaves Sansa in charge and aggressively warns Littlefinger to keep his distance. Samwell applies a forbidden treatment on Jorah's greyscale infection. Euron's fleet attacks Yara's. Obara and Nymeria are killed, while Ellaria, Tyene, and Yara are captured. Theon shows flashes of his time as Reek, hesitating to challenge Euron before fleeing the carnage by jumping into the sea."
        default:
            return Constants.RecapNotFound
        }
    }
}

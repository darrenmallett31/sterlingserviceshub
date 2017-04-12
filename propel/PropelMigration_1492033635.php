<?php

/**
 * Data object containing the SQL and PHP code to migrate the database
 * up to version 1492033635.
 * Generated on 2017-04-12 22:47:15 by c2grahamW
 */
class PropelMigration_1492033635
{

    /**
     * @param PropelMigrationManager $manager
     *
     * @return bool|void
     */
    public function preUp($manager)
    {
        // add the pre-migration code here
    }

    /**
     * @param PropelMigrationManager $manager
     */
    public function postUp($manager)
    {
        // add the post-migration code here
    }

    /**
     * @param PropelMigrationManager $manager
     *
     * @return bool|void
     */
    public function preDown($manager)
    {
        // add the pre-migration code here
    }

    /**
     * @param PropelMigrationManager $manager
     */
    public function postDown($manager)
    {
        // add the post-migration code here
    }

    /**
     * Get the SQL statements for the Up migration
     *
     * @return array list of the SQL strings to execute for the Up migration
     *               the keys being the datasources
     */
    public function getUpSQL()
    {
        return array (
  'ssdata' => '
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE `user`
    ADD `userGUID` VARCHAR(255) DEFAULT \'\' NOT NULL AFTER `password`;

ALTER TABLE `view_asset_allocation` DROP PRIMARY KEY;

ALTER TABLE `view_asset_allocation` CHANGE `id` `id` INTEGER NOT NULL;

ALTER TABLE `view_asset_allocation` ADD PRIMARY KEY (`id`);

ALTER TABLE `view_employees` DROP PRIMARY KEY;

ALTER TABLE `view_employees` CHANGE `Name` `Name` VARCHAR(66) NOT NULL;

ALTER TABLE `view_employees` ADD PRIMARY KEY (`Name`);

ALTER TABLE `view_quote` DROP PRIMARY KEY;

ALTER TABLE `view_quote` CHANGE `site` `site` VARCHAR(80) NOT NULL;

ALTER TABLE `view_quote` ADD PRIMARY KEY (`site`);

ALTER TABLE `view_roles` DROP PRIMARY KEY;

ALTER TABLE `view_roles` CHANGE `Name` `Name` VARCHAR(66) NOT NULL;

ALTER TABLE `view_roles` ADD PRIMARY KEY (`Name`);

CREATE TABLE `sessions`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `session_guid` VARCHAR(64) DEFAULT \'\' NOT NULL,
    `created_at` DATETIME NOT NULL,
    `accessed` DATETIME NOT NULL,
    `ip_address` VARCHAR(64) DEFAULT \'\' NOT NULL,
    `browser` VARCHAR(64) DEFAULT \'\' NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `sessions_FI_1` (`userId`)
) ENGINE=MyISAM;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
',
);
    }

    /**
     * Get the SQL statements for the Down migration
     *
     * @return array list of the SQL strings to execute for the Down migration
     *               the keys being the datasources
     */
    public function getDownSQL()
    {
        return array (
  'ssdata' => '
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `sessions`;

ALTER TABLE `user` DROP `userGUID`;

ALTER TABLE `view_asset_allocation` DROP PRIMARY KEY;

ALTER TABLE `view_asset_allocation` CHANGE `id` `id` INTEGER;

ALTER TABLE `view_asset_allocation` ADD ;

ALTER TABLE `view_employees` DROP PRIMARY KEY;

ALTER TABLE `view_employees` CHANGE `Name` `Name` VARCHAR(66);

ALTER TABLE `view_employees` ADD ;

ALTER TABLE `view_quote` DROP PRIMARY KEY;

ALTER TABLE `view_quote` CHANGE `site` `site` VARCHAR(80);

ALTER TABLE `view_quote` ADD ;

ALTER TABLE `view_roles` DROP PRIMARY KEY;

ALTER TABLE `view_roles` CHANGE `Name` `Name` VARCHAR(66);

ALTER TABLE `view_roles` ADD ;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
',
);
    }

}
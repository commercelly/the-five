{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div class="col-md-6 links">
  <div class="row">
  {foreach $linkBlocks as $linkBlock}
    <div class="col-md-6 wrapper">
      <p class="h5 hidden-sm-down">{$linkBlock.title}</p>
      {assign var=_expand_id value=10|mt_rand:100000}
      <div class="title clearfix d-block d-sm-none" data-target="#footer_sub_menu_{$_expand_id}" data-toggle="collapse">
        <span class="h5">{$linkBlock.title}</span>
        <span class="float-xs-right">
          <span class="navbar-toggler collapse-icons">
            <svg width="0.9em" height="0.9em" viewBox="0 0 16 16" class="bi bi-chevron-down" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
            </svg>
          </span>
        </span>
      </div>
      <ul id="footer_sub_menu_{$_expand_id}" class=" collapse show list-unstyled">
        {foreach $linkBlock.links as $link}
          <li>
            <a
                id="{$link.id}-{$linkBlock.id}"
                class="{$link.class} text-decoration-none link-light"
                href="{$link.url}"
                title="{$link.description}"
                {if !empty($link.target)} target="{$link.target}" {/if}
            >
              {$link.title}
            </a>
          </li>
        {/foreach}
      </ul>
    </div>
  {/foreach}
  </div>
</div>

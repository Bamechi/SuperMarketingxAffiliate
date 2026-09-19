#!/bin/bash
# Supermind Creator Network: copies the internal library into this site's team folder.
# Double-click, then drag your "New Documents" folder (or the Supermind Affiliate Library v3.1 folder) into this window and press Return.
cd "$(dirname "$0")"
DEST="$(ls -d downloads/team-* | head -1)"
read -r -p "Drag the folder that holds the SOP PDFs here, then press Return: " SRC
SRC="${SRC%\"}"; SRC="${SRC#\"}"; SRC="$(echo "$SRC" | sed 's/\\ / /g; s/[[:space:]]*$//')"
[ -d "$SRC" ] || { echo "That is not a folder: $SRC"; exit 1; }
FILES=(SM-SOP-00_LibraryIndex.pdf SM-SOP-01_CoordinatorOperatingManual.pdf SM-SOP-02_PlainEnglishGlossary.pdf SM-SOP-03_BrandVoiceBible.pdf SM-SOP-04_NonNegotiables.pdf SM-SOP-05_AutomationArchitecture.pdf SM-SOP-06_WeeklyOperatingRhythm.pdf SM-SOP-07_QuestionsAndEscalation.pdf SM-SOP-12_AffiliateLeadGen.pdf SM-SOP-13_WhopBuild.pdf SM-SOP-14_ManyChatBuild.pdf SM-SOP-15_CodesAndCommissions.pdf SM-SOP-16_ZiionGuide.pdf SM-SOP-17_TikTokShopBuild.pdf SM-SOP-25_AffiliateFAQs.pdf SM-SOP-26_CannedReplyLibrary.pdf SM-SOC-01_ContentSystem.pdf SM-MKT-01_HijackCampaigns.pdf SM-EOS-01_L10MeetingGuide.pdf SM-EOS-02_AccountabilityScorecardsRocks.pdf SM-QA-01_WhopLaunchVerification.pdf SM-NEWS-01_NewsletterVoiceManifesto.pdf SM-NEWS-02_PromptPack.pdf Supermind_Affiliate_Commissions_Tracker.xlsx)
ok=0; miss=()
for f in "${FILES[@]}"; do
  hit="$(find "$SRC" -type f -name "$f" -print -quit)"
  if [ -n "$hit" ]; then cp "$hit" "$DEST/"; ok=$((ok+1)); echo "copied  $f"; else miss+=("$f"); fi
done
echo; echo "$ok of ${#FILES[@]} copied into $DEST"
if [ ${#miss[@]} -gt 0 ]; then echo "MISSING, find these and drop them into $DEST by hand:"; printf '  %s\n' "${miss[@]}"; fi
read -r -p "Press Return to close."

# How to Earn the Pull Shark Badge (Step-by-Step)

**Pull Shark** is a GitHub achievement for opening pull requests that get merged. Use this guide with the Interview-Bot project to earn badges.

## Badge Tiers

| Tier | Merged PRs Required |
|------|---------------------|
| **Default** | 2 |
| **Bronze** | 16 |
| **Silver** | 128 |
| **Gold** | 1024 |

---

## Step-by-Step Process

### Step 1: Create a Branch for Your Change

```bash
# Make sure you're on main and up to date
git checkout main
git pull origin main

# Create a new branch (choose a descriptive name)
git checkout -b docs/update-ai-config
```

### Step 2: Make Your Changes

- Edit files (e.g. fix typos, add docs, small improvements)
- Keep changes focused—one logical change per PR
- Commit your work

```bash
git add .
git commit -m "docs: clarify AI provider configuration"
```

### Step 3: Push Your Branch

```bash
git push -u origin docs/update-ai-config
```

### Step 4: Open a Pull Request on GitHub

1. Go to: **https://github.com/fortunatoman/Interview-Bot**
2. You’ll see a yellow banner: "Compare & pull request" → click it
3. Or: **Branches** → select your branch → **New pull request**
4. Fill in:
   - **Title**: Short, clear description
   - **Description**: What changed and why
5. Click **Create pull request**

### Step 5: Merge the Pull Request

Because this is your own repo, you can merge your own PRs:

1. Open your PR
2. Review the diff (Files changed tab)
3. Click **Merge pull request**
4. Confirm with **Confirm merge**
5. Optional: delete the branch after merge

---

## Ideas for PRs (Interview-Bot)

| PR Idea | Branch Name | Difficulty |
|---------|-------------|------------|
| Update AI config docs | `docs/update-ai-config` | Easy |
| Add README.md | `docs/add-readme` | Easy |
| Fix typo in setup instructions | `docs/fix-setup-typo` | Easy |
| Add .gitignore improvements | `chore/improve-gitignore` | Easy |
| Add contribution guidelines | `docs/add-contributing` | Easy |

---

## Checklist for Each PR

- [ ] Create branch from `main`
- [ ] Make small, focused changes
- [ ] Commit with clear message
- [ ] Push branch to origin
- [ ] Open PR on GitHub
- [ ] Merge the PR
- [ ] Delete branch (optional)

---

## Important Notes

1. **Same repo**: You can earn the badge by merging PRs into your own repository.
2. **Must merge**: Only merged PRs count, not open or closed-without-merge PRs.
3. **One per PR**: Each merged PR counts once.
4. **Public repo**: The repository must be **public** for achievements to appear on your profile.
5. **Merge method**: Use **"Create a merge commit"** when merging (not Squash). Some users report squash/rebase merges may not count.
6. **Track progress**: Check https://github.com/fortunatoman?achievement=pull-shark

## Troubleshooting: Badge Not Showing?

- **Need 2 merged PRs** for the Default tier—having only 1 merged PR won't show the badge.
- **Check repo visibility**: Settings → General → Danger Zone → Change repository visibility to **Public**.
- **Use merge commit**: When merging, choose the dropdown next to "Merge pull request" → **Create a merge commit**.
- **Wait a few minutes**: Badges can take a short time to update after merging.

## Related: YOLO Badge

**YOLO** is earned by merging a pull request *without* reviewer approval. Important: you must **assign a reviewer** first, then **merge before they approve**.

### Steps to earn YOLO

1. Open your PR on GitHub
2. In the right sidebar, under **Reviewers**, click and add a reviewer (use a second GitHub account you control, or a collaborator)
3. **Immediately** click **Merge pull request**—do not wait for approval
4. Confirm the merge

Merging with no reviewer assigned does **not** count. The reviewer must be requested but you merge before they complete their review.

## Related: Quickdraw Badge

**Quickdraw** is earned by closing an issue or pull request **within 5 minutes** of opening it. Create a PR and merge it within 5 minutes, or open an issue and close it within 5 minutes.

## Related: Starstruck Badge

**Starstruck** is earned when a repository you created gets many stars. Tiers: Default 16, Bronze 128, Silver 512, Gold 4096. You cannot star your own repo—others must star it. Tips: add a clear README, set a good repo description on GitHub (Settings → General), share the repo with others, and promote it in communities.

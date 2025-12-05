## Markdown link of Mermaid live preview (may be persistent?)

[![](https://mermaid.ink/img/pako:eNpVkU-P0zAQxb_KyKe2ylZJSjeND4htuj0BB_4ICYJWbjJJLBxPGTvLhm6_O067IOGbR-_33hv7JCqqUUjRGPpVdYo9vP1QWgjn7tvsjg_as-IR3qMvdntotMH5d7i5ef382SGDtsfBP8N2Nlssij0UHVY_tG3hE5FZLObzq9P9m5Pr1BEl1FRFYNQBjYRSTATZhrhXtkLYUTX0aH0pzpeEvX7CGox2HqgBHgy6CB4Va3RA1oxwGCFYPCI7TTa0uKZtJxiKWSm-KLahjZPwwFhRH8xr5YPWPYAlDz2GrJeO2wnaBeiemdjJ6zRwPwfNONX6DxKR6DH01nV4u9MkLoXvgq4U02ZGt12QlfYchGrw9HG0lZCeB4wE09B2QjbKuHAbjqET7rRqWfX_pkdlvxL1fxGstSd-d_2qy49FouUp_MUybIZc0GC9kEn26mIg5Ek8CZmul_kmybN8lcVJkiWbTSTGME7jZRav01WcJekmj2_TcyR-XzLjZR6vb7N1lmfrJI-TdHX-AxIyraA?type=png)](https://mermaid.live/edit#pako:eNpVkU-P0zAQxb_KyKe2ylZJSjeND4htuj0BB_4ICYJWbjJJLBxPGTvLhm6_O067IOGbR-_33hv7JCqqUUjRGPpVdYo9vP1QWgjn7tvsjg_as-IR3qMvdntotMH5d7i5ef382SGDtsfBP8N2Nlssij0UHVY_tG3hE5FZLObzq9P9m5Pr1BEl1FRFYNQBjYRSTATZhrhXtkLYUTX0aH0pzpeEvX7CGox2HqgBHgy6CB4Va3RA1oxwGCFYPCI7TTa0uKZtJxiKWSm-KLahjZPwwFhRH8xr5YPWPYAlDz2GrJeO2wnaBeiemdjJ6zRwPwfNONX6DxKR6DH01nV4u9MkLoXvgq4U02ZGt12QlfYchGrw9HG0lZCeB4wE09B2QjbKuHAbjqET7rRqWfX_pkdlvxL1fxGstSd-d_2qy49FouUp_MUybIZc0GC9kEn26mIg5Ek8CZmul_kmybN8lcVJkiWbTSTGME7jZRav01WcJekmj2_TcyR-XzLjZR6vb7N1lmfrJI-TdHX-AxIyraA)

## Code

flowchart LR
    A[(Arbitrary NetCDF file)] -->|User input| B((**CF Checking Tool**))
    E@{shape: doc, label: "CF Conformance Document"} -->|Fixed list of rules, varies only by CF version| B
    B --> C("Warnings: _recommendations_ not met")
    B--> D("Errors:
    _requirements_ not met")

## Config. for style etc.

{
  "theme": "light"
}

